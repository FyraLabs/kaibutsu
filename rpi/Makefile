REF=$(shell cat ref)

ifeq ($(shell uname -m), x86_64)
        CROSS=aarch64-linux-gnu-
endif

setup:
	rm -rf ../linux/*.patch
	cp *.patch ../linux
	cp config ../linux/.config
	cd ../linux; \
	git reset --hard; \
	git clean -df; \
	git remote remove rpi; \
	git remote add rpi https://github.com/raspberrypi/linux.git; \
	git fetch rpi refs/heads/$(REF):refs/heads/$(REF); \
	git checkout $(REF); \
	for patch in $$(ls *.patch); do patch -p1 < "$$patch"; done; \
  git -c commit.gpgsign=false commit -a -m 'removing -dirty suffix after patches'
	
compile:
	ARCH=arm64 CROSS_COMPILE=$(CROSS) make -C ../linux olddefconfig rpm-pkg -j$(shell nproc)
	cp -r ../linux/rpmbuild .
	rm -rf ../linux/rpmbuild

build: setup compile
