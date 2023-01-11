SHELL = bash

DOCS_IMAGE := "mu-rprog-docs:local"
FORCE_REBUILD ?= 0

.PHONY: docs-image
docs-image:
	@if $$(docker image inspect ${DOCS_IMAGE} > /dev/null); then \
		if test ${FORCE_REBUILD} -le 0; then \
			echo "image '${DOCS_IMAGE}' already exists. To force rebuilding, run 'make docs-image -e FORCE_REBUILD=1'."; \
			exit 0; \
		fi; \
	fi;
	docker build \
		-t ${DOCS_IMAGE} \
		-f ./Dockerfile-docs \
		.

.PHONY: install
install:
	Rscript install-deps.R && \
	Rscript -e "remotes::install_github('ramnathv/slidify', force = FALSE)" && \
	Rscript -e "remotes::install_github('ramnathv/slidifyLibraries', force = FALSE)" && \
	R CMD INSTALL --with-keep.source ./code/RquetteBB

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
course:
	docker run \
		--rm \
		--entrypoint="" \
		-v "$${PWD}":/opt/mu_rprog \
		--workdir /opt/mu_rprog \
		rocker/verse \
		make install assignments code-samples slides syllabues
