project_name = kaibutsu

.PHONY: usage mt8183 mt8192 sc7180

usage:
	@echo "usage: make [kernel_variant|all]"

all: mt8183 mt8192 sc7180

mt8183:
	make -C mt8183 build

mt8192:
	make -C mt8192 build

sc7180:
	make -C sc7180 build
