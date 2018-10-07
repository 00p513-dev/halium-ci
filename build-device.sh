#!/usr/bin/env bash

DEVICE=$1
PRODUCT=$2

cd halium
source source build/envsetup.sh
./halium/devices/setup $DEVICE
breakfast $PRODUCT
mka hybris-boot halium-boot systemimage
