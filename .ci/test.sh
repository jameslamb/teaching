#!/bin/bash

# set up R environment
CRAN_MIRROR="https://cloud.r-project.org/"
R_LIB_PATH=~/Rlib
mkdir -p $R_LIB_PATH
export R_LIBS=$R_LIB_PATH
export PATH="$R_LIB_PATH/R/bin:$PATH"

# Get details needed for installing R components
export R_MAC_VERSION=4.0.2
export R_LINUX_VERSION="4.0.2-1.1804.0"
export R_APT_REPO="bionic-cran40/"

# installing precompiled R for Ubuntu
# https://cran.r-project.org/bin/linux/ubuntu/#installation
# adding steps from https://stackoverflow.com/a/56378217/3986677 to get latest version
if [[ $OS_NAME == "linux" ]]; then
    sudo apt-key adv \
        --keyserver keyserver.ubuntu.com \
        --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    sudo add-apt-repository \
        "deb https://cloud.r-project.org/bin/linux/ubuntu ${R_APT_REPO}"
    sudo apt-get update
    sudo apt-get install \
        --no-install-recommends \
        -y --allow-downgrades \
            r-base-dev=${R_LINUX_VERSION} \
            texinfo \
            texlive-latex-recommended \
            texlive-fonts-recommended \
            texlive-fonts-extra \
            qpdf \
            || exit -1
fi

# Installing R precompiled for Mac OS 10.11 or higher
if [[ $OS_NAME == "macos" ]]; then
    brew install qpdf
    brew cask install basictex
    export PATH="/Library/TeX/texbin:$PATH"
    sudo tlmgr --verify-repo=none update --self
    sudo tlmgr --verify-repo=none install inconsolata helvetic

    wget -q https://cran.r-project.org/bin/macosx/R-${R_MAC_VERSION}.pkg -O R.pkg
    sudo installer \
        -pkg $(pwd)/R.pkg \
        -target /
fi

conda install \
    -y \
    -q \
    --no-deps \
        pandoc

if [[ $TASK == "lint-r" ]]; then
    Rscript --vanilla -e "install.packages('lintr', repos = '${CRAN_MIRROR}', lib = '${R_LIB_PATH}', dependencies = c('Depends', 'Imports', 'LinkingTo'))" || exit -1
    Rscript ${BUILD_DIRECTORY}/.ci/lint-r-code.R ${BUILD_DIRECTORY} || exit -1
    exit 0
fi
