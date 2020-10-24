#!/usr/bin/env bash

HALIUM_BRANCH=7.1
DEVICE=bacon
PRODUCT=halium_bacon


# Copy bsdiff executable from host
mkdir -p halium/out/host/linux-x86/bin
cp $(command -v bsdiff) halium/out/host/linux-x86/bin/bsdiff

# Download device specific sources
source build/envsetup.sh
./halium/devices/setup ${DEVICE} --force-sync

# Delete git metadata to free up space
rm .repo -rf

# Delete non-linux build tools
rm -rf \
	$(find prebuilts -name "darwin*" -o -name "windows*" -type d) \
	$(find . -name "*.jar")

# Actually start building
lunch ${PRODUCT}-userdebug
mka mkbootimg hybris-boot halium-boot systemimage

cd ..
