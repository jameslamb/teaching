# This script installs packages needed to run the examples
# in the provided code supplements

if (!requireNamespace("slidify")) {
    remotes::install_github("ramnathv/slidify", force = FALSE)  # nolint: non_portable_path
}
if (!requireNamespace("slidifyLibraries")) {
    remotes::install_github("ramnathv/slidifyLibraries", force = FALSE)  # nolint: non_portable_path
}

install.packages(
    pkgs = c(
        "dygraphs"
        , "ineq"
        , "jsonlite"
        , "lubridate"
        , "openxlsx"
        , "quantmod"
        , "randomForest"
        , "rattle"
        , "remotes"
        , "stringr"
    )
    , repos = "https://cran.r-project.org"
    , dependencies = c("Depends", "Imports", "LinkingTo")
    , type = "both"
    , verbose = TRUE
    , quiet = FALSE
)

# {markdown} v1.2.0 removed the markdownExtensions() function used by {slidify}
# ref: https://github.com/rstudio/markdown/commit/6ef44310980aca1df52913678916d534fa739902
install.packages(
    "https://cran.r-project.org/src/contrib/Archive/markdown/markdown_1.1.tar.gz"
    , repos = NULL
    , type = "source"
)
