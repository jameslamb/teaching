# This script installs packages needed to run the examples
# in the provided code supplements

install.packages(
    pkgs = c(
        "devtools"
        , "gaussfacts"
        , "htmltab"
        , "ineq"
        , "jsonlite"
        , "lubridate"
        , "openxlsx"
        , "purrr"
        , "Quandl"
        , "quantmod"
        , "randomForest"
        , "rattle"
        , "rbokeh"
        , "roxygen2"
        , "stargazer"
        , "stringr"
        , "testthat"
    )
    , repos = "http://cran.r-project.org"
    , dependencies = c("Depends", "Imports")
    , verbose = TRUE
    , quiet = FALSE
)
