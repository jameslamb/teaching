# This script installs packages needed to run the examples
# in the provided code supplements

install.packages(
    pkgs = c(
        "devtools"
        , "gaussfacts"
        , "htmltab"
        , "jsonlite"
        , "lubridate"
        , "openxlsx"
        , "Quandl"
        , "quantmod"
        , "randomForest"
        , "rattle"
        , "rbokeh"
        , "stringr"
    )
    , repos = "http://cran.r-project.org"
    , dependencies = c("Depends", "Imports")
    , verbose = TRUE
    , quiet = FALSE
)
