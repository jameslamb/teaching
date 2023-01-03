.PHONY: lint
lint:
	Rscript ./.ci/lint-r-code.R $${PWD}/mu_rprog
