library(data.table)

changeDataset <- function(inDT) {

    # [must-use]
    #     :=, .N
    #
    # [description]
    #     add a new column "random_garbage", which contains the value
    #     TRUE for every row
    inDT[, random_garbage := rep(TRUE, .N)]

    # [must-use]
    #     setorderv()
    #
    # [description]
    #     sort inDT by "rating" and "privileges"
    data.table::setorderv(
        x = inDT
        , cols = c("rating", "privileges")
    )

    # [must-use]
    #     :=
    #
    # [description]
    #     remove the column "advance"
    inDT[, advance := NULL]

    # [must-use]
    #     setcolorder()
    #
    # [description]
    #     change the column order to
    #     1. "complaints"
    #     2. "rating"
    #     3. "privileges"
    #     4. "random_garbage"
    #     5. "critical"
    #     6. "raises"
    #     7. "learning"
    data.table::setcolorder(
        x = inDT
        , neworder = c(
            "complaints"
            , "rating"
            , "privileges"
            , "random_garbage"
            , "critical"
            , "raises"
            , "learning"
        )
    )

    # [must-use]
    #     :=
    #
    # [description]
    #     multiply every value in "raises" by 20
    inDT[, raises := raises * 20]

    # [must-use]
    #     setnames()
    #
    # [description]
    #     add the length of each column name to the column name
    #     so e.g. "rating" should become "rating_6" because "rating" has 6
    #     characters. You must use nchar() to get the lengths.
    data.table::setnames(
        x = inDT
        , old = names(inDT)
        , new = paste0(names(inDT), "_", nchar(names(inDT)))
    )

    return(invisible(NULL))
}


# tests
library(data.table)
local_file <- "solution.rds"
if (!file.exists(local_file)) {
    solution_url <- "https://github.com/jameslamb/teaching/releases/download/mu_rprog/extra-credit-solution.rds"
    download.file(
        url = solution_url
        , destfile = local_file
    )
}
solutionDT <- readRDS(local_file)

data("attitude")
attitudeDT <- data.table::as.data.table(attitude)
ret <- changeDataset(attitudeDT)
if (!is.null(ret)) {
    stop("changeDataset() should not return anything")
}

errors <- data.table:::all.equal.data.table(
    attitudeDT
    , solutionDT
)
if (!isTRUE(errors)) {
    print(errors)
    stop("Errors were found!")
} else {
    print("your code is great and so are you")
}
