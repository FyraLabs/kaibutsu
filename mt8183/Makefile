REF=$(shell cat ref)

ifeq ($(shell uname -m), x86_64)
        CROSS=aarch64-linux-gnu-
endif

build:
	rm -rf ../linux/*.patch
	cp *.patch ../linux
	cp config ../linux/.config
	(cd ../linux && git reset --hard && git fetch origin refs/tags/$(REF):refs/tags/$(REF) && git checkout $(REF) && git apply *.patch && sed  -i 's/^EXTRAVERSION.*/EXTRAVERSION = -mt8183/'  Makefile)
	ARCH=arm64 CROSS_COMPILE=$(CROSS) make -C ../linux olddefconfig rpm-pkg -j$(shell nproc)
	cp -r ../linux/rpmbuild .
	rm -rf ../linux/rpmbuild
