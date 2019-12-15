library(testthat)
library(RquetteBB)

test_check(
    package = "RquetteBB"
    , stop_on_failure = TRUE
    , stop_on_warning = FALSE
)
