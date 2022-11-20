.PHONY: help build check clean

postcss = npx --no postcss $(1) --output $(2)

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	dist/**/*.css

dist/**/*.css: | src/**/*.css
	$(foreach f,$|,$(call postcss,$(f),$(patsubst src/%,dist/%,$f);))

check: | src/**/*.css
	npx --no -- stylelint -f verbose '$|'

dist:
	mkdir $@

server:
	npx --yes -- http-server --port=8080 .

clean: dist
	rm -rf $<
