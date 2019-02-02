#' @title Names to abbreviations
#' @name NamesToAbbreviations
#' @description This function takes a vector of names and returns a vector of corresponding initials.
#' @param nameVec A character vector of player names
#' @importFrom purrr map_chr
#' @importFrom stringr str_split
#' @export
NamesToAbbreviations <- function(nameVec){

    # Split on whitespace
    splitNames <- stringr::str_split(nameVec, pattern = " ", simplify = FALSE)

    # Grab the first letter of each name and combines
    abbrevs <- purrr::map_chr(splitNames, function(splitName){
        firstInitial <- substr(splitName[1], 1, 1)
        lastInitial  <- substr(splitName[2], 1, 1)
        return(paste0(firstInitial, lastInitial))
    })

    # Return the character vector of abbreviations
    return(abbrevs)
}

#' @title Get Marquette BB Data
#' @name GetData
#' @description This function scrapes sports-reference.com and returns some
#'              player statistics for Marquette's men's basketball team.
#' @param season String indicating which season you want to pull data for.
#'               e.g. set to "2017" for 2016-17 season stats
#' @importFrom data.table data.table
#' @importFrom htmltab htmltab
#' @export
GetData <- function(team = "marquette", season = "2018"){

    # Build URL
    queryURL <- sprintf(
        "https://www.sports-reference.com/cbb/schools/%s/%s.html"
        , team
        , season
    )

    # Grab tables from college basketbal reference
    result <- htmltab::htmltab(
        queryURL
        , which = "//table[@id = 'per_game']"
    )

    # Convert to data.table
    statDT <- data.table::as.data.table(result)

    # Coerce all the columns but Player to numeric
    numCols <- setdiff(names(statDT), "Player")
    statDT <- cbind(
        statDT[, "Player"]
        , statDT[, lapply(.SD, as.numeric), .SDcols = numCols]
    )

    # Return the table
    return(statDT)
}

#' @title Scatterplot Comparison of Player Stats
#' @name CompareOnStats
#' @description Given a data.table of Marquette basketball statistics, plot a bivariate scatterplot of player performance on the basis of two statistics
#' @import data.table
#' @importFrom graphics plot text
#' @param statDT A data.table of Marquette season stats, pulled with \code{\link[RquetteBB]{GetData}}
#' @param x_stat A string with the name of the statistic to plot on the x-axis
#' @param y_stat A string with the name of the statistic to plot on the y-axis
#' @param season String indicating which season you pull data for. Used to create plot title
#' @param useInitials A boolean. If TRUE, player initials will be plotted. If FALSE, full names will be used.
#' @export
CompareOnStats <- function(statDT
                           , x_stat = "PTS"
                           , y_stat = "TB"
                           , season
                           , useInitials = TRUE
){

    # Create a scatterplot
    plot(x = statDT[, get(x_stat)], y = statDT[, get(y_stat)],
         xlab = x_stat, ylab = y_stat,
         type = "p", col = "white",
         main = paste0(x_stat, " vs. ", y_stat, " (", season, ")"))

    # Grab abbreviations from player names if asked
    if (useInitials){
        namesToPlot <- NamesToAbbreviations(statDT[, Player])
    } else {
        namesToPlot <- statDT[, Player]
    }

    # Add those abbreviations to the plot
    text(x = statDT[, get(x_stat)]
         , y = statDT[, get(y_stat)]
         , labels = namesToPlot)

    return(invisible(NULL))
}
