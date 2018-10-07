#!/usr/bin/env bash

DEVICE=$1
PRODUCT=$2

# Seems like we can't share this step between the different jobs :/
mkdir halium && cd halium
repo init -u https://github.com/Halium/android -b halium-7.1 --depth=1
repo sync -c -j 16

# Actually start building
source build/envsetup.sh
./halium/devices/setup $DEVICE
breakfast $PRODUCT
mka hybris-boot halium-boot systemimage
