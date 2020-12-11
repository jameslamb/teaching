# This script installs packages needed to run the examples
# in the provided code supplements

install.packages(
    pkgs = c(
        "gaussfacts"
        , "htmltab"
        , "jsonlite"
        , "lubridate"
        , "openxlsx"
        , "Quandl"
        , "quantmod"
        , "randomForest"
        , "rattle"
        , "rbokeh"
        , "remotes"
        , "stringr"
    )
    , repos = "http://cran.r-project.org"
    , dependencies = c("Depends", "Imports")
    , verbose = TRUE
    , quiet = FALSE
    , type = "binary"
)
