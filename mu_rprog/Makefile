
SHELL = bash

.PHONY: install assignments code_samples slides syllabus course

# Install all the necessary R packages for examples in this class
install:
	Rscript install_deps.R && \
	Rscript -e "devtools::install_github('ramnathv/slidify', force = FALSE)" && \
	Rscript -e "devtools::install_github('ramnathv/slidifyLibraries', force = FALSE)" && \
	cd code/RquetteBB && \
	Rscript -e "devtools::install()"


assignments:
	cd assignments/ && \
	for f in $$(ls | grep Rmd) ; do \
		Rscript -e "rmarkdown::render('$$f')" ; \
	done && \
	cd ..

code_samples:
	cd code/ && \
	for f in $$(ls | grep Rmd) ; do \
		Rscript -e "rmarkdown::render('$$f')" ; \
	done && \
	cd ..

slides:
	cd slides/ && \
	for f in $$(ls | grep Rmd) ; do \
		Rscript -e "slidify::slidify('$$f')" ; \
	done && \
	cd ..

syllabus:
	Rscript -e "rmarkdown::render('syllabus.Rmd')"

# Recipe to remake the entire course
course:
	make assignments && \
	make code_samples && \
	make slides && \
	make syllabus
