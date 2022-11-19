.PHONY: help build check clean
.PHONY: src/**/*.css

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	dist/style.css

check: | src/**/*.css
	npx --no -- stylelint -f verbose '$|'

dist/style.css: | src/style.css dist
	npx --no postcss $(word 1,$|) --output $@

dist:
	mkdir $@

server:
	npx --yes -- http-server --port=8080 .

clean: dist
	rm -rf $<
