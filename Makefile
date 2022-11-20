.PHONY: help build check clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	dist/**/*.css

dist/**/*.css:
	$(MAKE) -j dist/main dist/csstools

dist/main: | src/main
	npx --no postcss $| --dir $@

dist/csstools: | src/csstools
	npx --no postcss $| --dir $@

check: | src/**/*.css
	npx --no -- stylelint -f verbose '$|'

dist:
	mkdir $@

server:
	npx --yes -- http-server --port=8080 .

clean: dist
	rm -rf $<
