#!/bin/sh
set -e

fetch_sources() {
  mkdir src
  (cd src && git clone -b dev/caver https://github.com/rgov/caver-llvm.git llvm)
  (cd src/llvm/tools && git clone -b dev/caver https://github.com/rgov/caver-clang.git clang)
  (cd src/llvm/projects && git clone -b dev/caver https://github.com/rgov/caver-compiler-rt.git compiler-rt)
}

fetch_sources
