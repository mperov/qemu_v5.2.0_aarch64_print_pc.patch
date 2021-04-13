#!/bin/bash

git clone --recursive https://github.com/qemu/qemu.git

cd qemu/
git checkout v5.2.0
git submodule update --init --recursive
git apply ../aarch64_print_pc.patch

mkdir build
cd build
../configure --target-list=aarch64-linux-user
make
