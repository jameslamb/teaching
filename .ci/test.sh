#!/bin/bash

# set up R environment
CRAN_MIRROR="https://cloud.r-project.org/"

if [[ $TASK == "lint-r" ]]; then
    Rscript --vanilla -e "install.packages(c('httr', 'lintr'), repos = '${CRAN_MIRROR}', dependencies = c('Depends', 'Imports', 'LinkingTo'))" || exit -1
    Rscript .ci/lint-r-code.R ${BUILD_DIRECTORY} || exit -1
    exit 0
fi
