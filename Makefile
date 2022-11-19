.PHONY: help build clean


help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	dist/style.css

dist/style.css: | src/style.css dist
	npx --no postcss $(word 1,$|) --output $@

dist:
	mkdir $@

server:
	npx --yes -- http-server --port=8080 .

clean: dist
	rm -rf $<
