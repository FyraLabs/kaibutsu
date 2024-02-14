project_name = kaibutsu

.PHONY: usage mt8183

usage:
	@echo "usage: make [kernel_variant|all]"

all: mt8183

mt8183:
	make -C mt8183 build
