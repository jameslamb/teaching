SHELL = bash

.PHONY: install
install:
	Rscript install-deps.R

.PHONY: assignments
assignments:
	find \
		./assignments \
		-name '*.Rmd' \
		-exec Rscript -e "rmarkdown::render(commandArgs(trailingOnly=TRUE)[[1]])" {} \;

.PHONY: code-samples
code-samples:
	find \
		./code \
		-name '*.Rmd' \
		-exec Rscript -e "rmarkdown::render(commandArgs(trailingOnly=TRUE)[[1]])" {} \;

.PHONY: slides
slides:
	find \
		./slides \
		-name '*.Rmd' \
		-exec Rscript -e "slidify::slidify(commandArgs(trailingOnly=TRUE)[[1]])" {} \;

.PHONY: syllabus
syllabus:
	Rscript -e 'rmarkdown::render("syllabus.Rmd", output_format = c("pdf_document", "html_document"))'

.PHONY: course
course: install assignments code-samples slides syllabus
	@echo "made course"
