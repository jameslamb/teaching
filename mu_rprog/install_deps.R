# This script installs packages needed to run the examples
# in the provided code supplements
quit(status = 0)

# "devtools" is needed to handle weird nonsense
install.packages(
    "devtools"
    , repos = "http://cran.rstudio.com"
    , dependencies = c("Depends", "Imports")
    , verbose = TRUE
    , quiet = FALSE
)

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
