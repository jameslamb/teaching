
# This script installs packages needed to run the examples 
# in the provided code supplements

# "devtools" is needed to handle weird nonsense
install.packages("devtools", repos = "http://cran.rstudio.com")

install.packages(
    pkgs = c(
        "gaussfacts"
        , "ineq"
        , "lubridate"
        , "openxlsx"
        , "purrr"
        , "Quandl"
        , "quantmod"
        , "randomForest"
        , "rattle"
        , "rbokeh"
        , "RGtk2"
        , "rjson"
        , "roxygen2"
        , "stargazer"
        , "stringr"
        , "testthat"
        , "webshot"
    )
    , repos = "http://cran.rstudio.com"
    , dependencies = c("Depends", "Imports")
    , verbose = TRUE
)
