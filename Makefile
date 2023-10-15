.PHONY: help docs
# Put it first so that "make" without argument is like "make help"
# God bless the interwebs:
# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

help: ## List Makefile targets
	$(info Makefile documentation)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

clean: ## Clean up files
	rm ZacharyTairaResume.aux
	rm ZacharyTairaResume.dvi
	rm ZacharyTairaResume.log

pdf: ## Create the pdf
	latex ZacharyTairaResume.tex
	dvipdfmx ZacharyTairaResume.dvi

build: pdf clean ## Create the pdf, then clean
