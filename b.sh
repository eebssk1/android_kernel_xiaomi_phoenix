#!/bin/sh

git clone --depth 1 https://github.com/kdrag0n/proton-clang

sudo apt-get install -y libelf-dev libssl-dev dwarves bc jitterentropy-rngd schedtool device-tree-compiler

export PATH=${PWD}/proton-clang/bin:$PATH

mkdir out

cp arch/arm64/configs/phoenix_defconfig  out/.config

export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

schedtool -B -e make -j3 CC=clang LD=ld.lld NM=llvm-nm O=out
