
# Our goal:
# - generate a report on monthly high-level inflation and
#   commodities prices

# Load up our libraries
suppressPackageStartupMessages({
    library(Quandl)
    library(quantmod)
    library(lubridate)
    library(data.table)
})

#######################
# Monthly commodities #
#######################
macro_symbols <- "CPIAUCSL"
quantmod::getSymbols(
    Symbols = macro_symbols
    , src = "FRED"
)

#########################
# Daily LME spot prices #
#########################
cobaltDF   <- Quandl::Quandl("LME/PR_MO")
aluminumDF <- Quandl::Quandl("LME/PR_AL")
tinDF      <- Quandl::Quandl("LME/PR_TN")
copperDF   <- Quandl::Quandl("LME/PR_CU")
nickelDF   <- Quandl::Quandl("LME/PR_NI")

# Given this data....let's solve the problem with data.table!

# Step 1 - Create a function for pulling an arbitrary set of metals prices from LME
get_metal_prices <- function(qcodes) {

    responseList <- lapply(
        X = names(qcodes)
        , qcodes = qcodes
        , function(metal_name, qcodes) {

            print(sprintf("Fetching data for %s...", qcodes[[metal_name]]))

            # Grab the dataset and immediately drop columns we don't care about
            responseDT <- data.table::as.data.table(
                Quandl::Quandl(
                    code = qcodes[[metal_name]]
                    , start_date = "2001-12-31"
                    , end_date = "2018-03-12"
                )
            )[, .SD, .SDcols = c("Date", `Cash Buyer`)]

            # Change names
            data.table::setnames(responseDT, c("obs_date", metal_name))
        }
    )

    # merge datasets on time
    outDT <- Reduce(
        f = function(x, y) {
            merge(x, y, all = TRUE, by = "obs_date")
        }
        , x = responseList
    )
    return(outDT)
}

spot_codes <- c(
    "cobalt_spot" = "LME/PR_MO"
    , "aluminum_spot" = "LME/PR_AL"
    , "tin_spot" = "LME/PR_TN"
    , "copper_spot" = "LME/PR_CU"
    , "nickel_spot" = "LME/PR_NI"
)

metalsDT <- get_metal_prices(spot_codes, "Cash Buyer")


# Step 2 - grab our US macro monthly series
macro_codes <- c(
    "cpi_inflation" = "CPIAUCSL"
    , "pce_inflation" = "PCEPILFE"
)

get_macro_data <- function(mcodes) {
    responseList <- lapply(
        X = names(mcodes)
        , mcodes = mcodes
        , FUN = function(macro_name, mcodes) {

            # get data and convert to data.table
            macroDT <- data.table::as.data.table(
                quantmod::getSymbols(
                    Symbols = mcodes[[macro_name]]
                    , src = "FRED"
                    , auto.assign = FALSE
                )
            )

            # change names in place
            data.table::setnames(macroDT, c("obs_date", macro_name))
        }
    )

    # merge datasets on time
    outDT <- Reduce(
        f = function(x, y) {
            merge(x, y, all = TRUE, by = "obs_date")
        }
        , x = responseList
    )
    return(outDT)
}

macroDT <- get_macro_data(macro_codes)

# Combine into a new data.table with overlapping observations
data.table::setkeyv(metalsDT, "obs_date")
data.table::setkeyv(fullDT, "obs_date")
fullDT <- merge(
    x = metalsDT
    , y = macroDT
    , by = "obs_date"
    , all.x = TRUE
    , all.y = FALSE
)

# oh no! we have missing data! We need to convert the metals data to monthly
# averages to better compare to the inflation series
.ym <- function(some_date) {
    lubridate::make_date(
        year = lubridate::year(some_date)
        , month = lubridate::month(some_date)
        , day = 1L
    )
}

metalsDT[, obs_month := .ym(obs_date)]
monthlyMetalsDT <- metalsDT[, lapply(.SD, function(x) {mean(x, na.rm = TRUE)})
                           , .SDcols = setdiff(names(metalsDT), c("obs_date", "obs_month"))
                           , by = "obs_month"]

# Now let's try that join again!
rm(fullDT)
fullDT <- merge(
    x = monthlyMetalsDT
    , y = macroDT
    , by.x = "obs_month"
    , by.y = "obs_date"
    , all.x = TRUE
    , all.y = FALSE
)

# woo! we have 75-ish months of data! Now to make fair comparisons, let's make
# a dataset of % month-over-month growth rates in each of these measures. We can do
# that with the data.table::shift() function
for (colname in setdiff(names(fullDT), "obs_month")) {
    new_name <- paste0(colname, "_MoM")
    print(sprintf("Creating %s...", new_name))

    fullDT[, (new_name) := (get(colname) - shift(get(colname), n = 1, type = "lag")) / get(colname)]
}
