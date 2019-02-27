#!/bin/bash
# build_bootimg_packages.sh - Build and/or install extra packages
# needed for droid-hal-img-boot

if [[ ! -d rpm/dhd ]]; then
    echo $0: 'launch this script from the $ANDROID_ROOT directory'
    exit 1
fi
# utilities
. ./rpm/dhd/helpers/util.sh

sb2 -t $VENDOR-$DEVICE-$PORT_ARCH -R -msdk-install zypper ref -f

sb2 -t $VENDOR-$DEVICE-$PORT_ARCH -R -m sdk-install zypper -n install -f \
    e2fsprogs openssh-clients openssh-server

BUILDALL=y
buildmw -u "https://github.com/sailfishos/yamui" || die
buildmw -u "https://github.com/sailfishos/initrd-helpers/" || die
buildmw -u "https://github.com/sailfishos/hw-ramdisk" || die
BUILDALL=n
