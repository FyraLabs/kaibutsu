REF=$(shell cat ref)

ifeq ($(shell uname -m), x86_64)
        CROSS=aarch64-linux-gnu-
endif

setup:
	rm -rf ../linux/*.patch
	cp *.patch ../linux
	cd ../linux; \
	git remote remove raspberrypi; \
	git remote add raspberrypi https://github.com/raspberrypi/linux.git; \
	git checkout master; \
	git branch -D $(REF); \
	git fetch -f raspberrypi refs/heads/$(REF):refs/heads/$(REF); \
	git reset --hard raspberrypi/$(REF); \
	git clean -df; \
	for patch in $$(ls *.patch); do patch -p1 < "$$patch"; done; \
  git -c commit.gpgsign=false commit -a -m 'removing -dirty suffix after patches'; \
	make ARCH=arm64 bcm2712_defconfig
	
compile:
	ARCH=arm64 CROSS_COMPILE=$(CROSS) make -C ../linux olddefconfig rpm-pkg -j$(shell nproc)
	cp -r ../linux/rpmbuild .
	rm -rf ../linux/rpmbuild

build: setup compile
