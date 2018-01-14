
SHELL = bash

.PHONY: make_install slides

make install:
	Rscript -e "devtools::install_github('ramnathv/slidify', force = FALSE)" && \
	Rscript -e "devtools::install_github('ramnathv/slidifyLibraries', force = FALSE)"

slides:
	cd slides/ && \
	for f in $$(ls | grep Rmd) ; do \
		Rscript -e "slidify::slidify('$$f')" ; \
	done
