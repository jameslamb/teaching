SHELL = bash

.PHONY: install assignments code_samples slides syllabus course

install:
	Rscript install_deps.R && \
	Rscript -e "devtools::install_github('ramnathv/slidify', force = FALSE)" && \
	Rscript -e "devtools::install_github('ramnathv/slidifyLibraries', force = FALSE)" && \
	R CMD install --with-keep.source code/RquetteBB

assignments:
	for f in $$(ls assignments/ | grep Rmd) ; do \
		Rscript -e "rmarkdown::render('assignments/$$f')" ; \
	done

code_samples:
	for f in $$(ls code/ | grep Rmd) ; do \
		Rscript -e "rmarkdown::render('code/$$f')" ; \
	done

slides:
	for f in $$(ls slides/ | grep Rmd) ; do \
		Rscript -e "slidify::slidify('slides/$$f')" ; \
	done

syllabus:
	Rscript -e "rmarkdown::render('syllabus.Rmd')"
	Rscript -e "rmarkdown::render('syllabus-async.Rmd')"

# Recipe to remake the entire course
course: install assignments code_samples slides syllabus
	@echo "made course"
