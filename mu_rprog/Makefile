SHELL = bash

.PHONY: install assignments code-samples slides syllabus course

.PHONY: install
install:
	Rscript install-deps.R && \
	Rscript -e "remotes::install_github('ramnathv/slidify', force = FALSE)" && \
	Rscript -e "remotes::install_github('ramnathv/slidifyLibraries', force = FALSE)" && \
	R CMD install --with-keep.source code/RquetteBB

.PHONY: assignments
assignments:
	for f in $$(ls assignments/ | grep Rmd) ; do \
		Rscript -e "rmarkdown::render('assignments/$$f')" ; \
	done

.PHONY: code-samples
code-samples:
	for f in $$(ls code/ | grep Rmd) ; do \
		Rscript -e "rmarkdown::render('code/$$f')" ; \
	done

.PHONY: slides
slides:
	for f in $$(ls slides/ | grep Rmd) ; do \
		Rscript -e "slidify::slidify('slides/$$f')" ; \
	done

.PHONY: syllabus
syllabus:
	Rscript -e "rmarkdown::render('syllabus-async.Rmd')"

.PHONY: course
course: install assignments code-samples slides syllabus
	@echo "made course"
