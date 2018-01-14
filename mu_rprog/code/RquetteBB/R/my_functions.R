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
#' @description This function scrapes ESPN.com and returns some player statistics for
#'              Marquette's men's basketball team.
#' @param season String indicating which season you want to pull data for. 
#'               e.g. set to "2017" for 2016-17 season stats
#' @importFrom data.table data.table
#' @importFrom XML readHTMLTable
#' @export
GetData <- function(season){
    
    # Build URL
    queryURL <- paste0("http://www.espn.com/mens-college-basketball/team/stats/_/id/269/year/", season)
    
    # Grab tables from ESPN
    result <- XML::readHTMLTable(queryURL)
    
    # Clean up the tables
    stats1 <- data.table::data.table(result[[1]])
    stats2 <- data.table::data.table(result[[2]])
    
    # These tables are kind of gross...they don't do a good job of finding headers. Need to clean these
    stats1 <- .cleanTable(stats1)
    stats2 <- .cleanTable(stats2)
    
    # Merge the tables
    statDT <- merge(stats1, stats2, by = "Player")
    
    # Coerce all the columns but Player to numeric
    numCols <- setdiff(names(statDT), "Player")
    statDT <- cbind(statDT[, "Player"], statDT[, lapply(.SD, as.numeric), .SDcols = numCols])
    
    # Return the table
    return(statDT)
}

# non-exported helper function for cleaning up the tables
#' @importFrom data.table setnames
.cleanTable <- function(resultDT){
    
    # Find the row w/ headers
    resultDT <- resultDT[, lapply(.SD, as.character)]
    headerRow <- which(resultDT[,1]=="Player")
    headers   <- as.character(resultDT[(headerRow),])
    
    # Subset out the nonsense
    resultDT <- resultDT[(headerRow + 1):nrow(resultDT)]
    
    # Reset names with the header row
    data.table::setnames(resultDT, names(resultDT), headers)
    
    # Drow the "totals" row
    resultDT <- resultDT[Player != "Totals"]
    
    # If we're working on the "per game" DT, change MIN
    if ("PPG" %in% names(resultDT)){
        data.table::setnames(resultDT, "MIN", "MINPG")
    }
    
    return(resultDT)
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
                           , x_stat = "PPG"
                           , y_stat = "RPG"
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
    
    return(NULL)
}
