SHELL = bash

.PHONY: install
install:
	Rscript install-deps.R

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
	Rscript -e 'rmarkdown::render("syllabus.Rmd", output_format = c("pdf_document", "html_document"))'

.PHONY: course
course: install assignments code-samples slides syllabus
	@echo "made course"
