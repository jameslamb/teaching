# This script installs packages needed to run the examples
# in the provided code supplements

# "devtools" is needed to handle weird nonsense
install.packages("devtools", repos = "http://cran.rstudio.com")

install.packages(
    pkgs = c(
        "gaussfacts"
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
        , "RGtk2"
        , "roxygen2"
        , "stargazer"
        , "stringr"
        , "testthat"
    )
    , repos = "http://cran.rstudio.com"
    , dependencies = c("Depends", "Imports")
    , verbose = TRUE
)
