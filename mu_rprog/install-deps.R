# This script installs packages needed to run the examples
# in the provided code supplements

if (!requireNamespace("slidify")) {
    remotes::install_github("ramnathv/slidify", force = FALSE)
}
if (!requireNamespace("slidifyLibraries")) {
    remotes::install_github("ramnathv/slidifyLibraries", force = FALSE)
}

install.packages(
    pkgs = c(
        "htmltab"
        , "ineq"
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
)

# {markdown} v1.2.0 removed the markdownExtensions() function used by {slidify}
# ref: https://github.com/rstudio/markdown/commit/6ef44310980aca1df52913678916d534fa739902
install.packages(
    "http://cran.r-project.org/src/contrib/Archive/markdown/markdown_1.1.tar.gz"
    , repos = NULL
    , type = "source"
)
