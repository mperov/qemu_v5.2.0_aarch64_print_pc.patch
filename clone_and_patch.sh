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

echo -e ""
echo -e "Now, you may run aarch64 binary on QEMU like here:"
echo -e "./qemu/build/qemu-aarch64 -L /usr/aarch64-linux-gnu <name-of-your-binary>"
echo -e "and you may see similar to it:"
echo -e "current pc: 55018d1e30\ncurrent pc: 55018d1eb8\ncurrent pc: 55018d1eb8\ncurrent pc: 55018d1eb8"
echo -e "current pc: 55018d1eb8\ncurrent pc: 55018d1ecc\ncurrent pc: 55018d1e78\ncurrent pc: 55018d1e78"
echo -e ""
