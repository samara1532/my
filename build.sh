#!/bin/bash

set -e -o pipefail

rm -rf build_dir
rm -rf source_dir

mkdir build_dir
mkdir source_dir

PKG_NAME=arm-trusted-firmware
PKG_VERSION=2.3-rc0

PKG_SOURCE=${PKG_NAME}-v${PKG_VERSION}.tar.gz
PKG_SOURCE_URL=https://codeload.github.com/ARM-software/arm-trusted-firmware/tar.gz/v${PKG_VERSION}?
PKG_HASH=d0f2c71462c43e5815f8d906558782f7c583e4c07cc972aa8a53124ca8b48886

wget -O ${PKG_SOURCE} ${PKG_SOURCE_URL}

#todo hash check

tar -C source_dir/ -xzf ${PKG_SOURCE}

ATF_DIR=source_dir/${PKG_NAME}-${PKG_VERSION}/

make -C ${ATF_DIR} \
CROSS_COMPILE="aarch64-linux-gnu-" \
M0_CROSS_COMPILE="arm-none-eabi-" \
PLAT=rk3399 \
bl31

cp ${ATF_DIR}/build/rk3399/release/bl31/bl31.elf build_dir/