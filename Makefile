project_name = kaibutsu

.PHONY: usage mt8183 mt8192 sc7180 chromebook rpi5 rpi4

usage:
	@echo "usage: make [kernel_variant|all]"

all: mt8183 mt8192 sc7180 chromebook rpi

mt8183:
	make -C mt8183 build

mt8192:
	make -C mt8192 build

sc7180:
	make -C sc7180 build

chromebook:
	make -C chromebook build

rpi5:
	make -C rpi5 build

rpi4:
	make -C rpi4 build
