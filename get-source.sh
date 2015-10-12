#!/bin/bash -ex
# Download all sources for clang, libc++ and libcxxabi.
. config.sh

mkdir -p $SRC
cd $SRC

git clone http://llvm.org/git/llvm.git llvm
cd llvm/tools
git clone http://llvm.org/git/clang.git 
cd ../projects 
git clone http://llvm.org/git/compiler-rt.git 
cd ../tools/clang/tools 
git clone http://llvm.org/git/clang-tools-extra.git 

cd $SRC/llvm 
mkdir -p build-clang # (for building without polluting the source dir)
cd build-clang
../configure --enable-optimized --enable-targets=host-only --prefix=$PREFIX
make -j 4
