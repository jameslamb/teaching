#!/bin/bash

set -e -u -o pipefail

# set up R environment
CRAN_MIRROR="https://cloud.r-project.org/"

if [[ $TASK == "lint-r" ]]; then
    Rscript --vanilla -e "install.packages('lintr', repos = '${CRAN_MIRROR}', dependencies = c('Depends', 'Imports', 'LinkingTo'))"
    Rscript .ci/lint-r-code.R ./mu_rprog
    exit 0
fi
