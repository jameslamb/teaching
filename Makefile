SHELL = bash

.PHONY: clean
clean:
	git clean -d -f -X

.PHONY: install
install:
	Rscript ./.ci/install-deps.R

.PHONY: assignments
assignments:
	find \
		./mu_rprog/assignments \
		-name '*.Rmd' \
		-exec Rscript -e "rmarkdown::render(commandArgs(trailingOnly=TRUE)[[1]])" {} \;

.PHONY: code-samples
code-samples: clean
	find \
		./mu_rprog/code \
		-name '*.Rmd' \
		-exec Rscript -e "rmarkdown::render(commandArgs(trailingOnly=TRUE)[[1]])" {} \;

.PHONY: slides
slides:
	find \
		./mu_rprog/slides \
		-name '*.Rmd' \
		-exec Rscript -e "slidify::slidify(commandArgs(trailingOnly=TRUE)[[1]])" {} \;

.PHONY: syllabus
syllabus:
	Rscript -e 'rmarkdown::render("./mu_rprog/syllabus.Rmd", output_format = c("pdf_document", "html_document"))'

.PHONY: course
course: clean install assignments code-samples slides syllabus
	@echo "made course"
