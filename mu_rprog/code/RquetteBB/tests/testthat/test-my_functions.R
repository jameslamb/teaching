context("Testing RquetteBB functions")

#===== 1. NamesToAbbreviations

test_that("NamesToAbbreviations should return the expected output for simple vectors", {
    someNames <- c("Joe Buck", "Chris Berman", "Michelle Tafoya")
    expect_identical(NamesToAbbreviations(someNames), c("JB", "CB", "MT"))
    expect_true(class(NamesToAbbreviations(someNames)) == "character")
})

#===== 2. NamesToAbbreviations

test_that("GetData should return a data.table", {
    statDT <- GetData(season = "2017")
    expect_true(data.table::is.data.table(statDT))
    expect_true("Player" %in% names(statDT))
})
