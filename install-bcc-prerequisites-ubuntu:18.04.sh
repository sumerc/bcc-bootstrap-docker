#!/bin/bash

set -eu

apt-get -y install linux-headers-$(uname -r) bison build-essential cmake flex \
  git libedit-dev libllvm6.0 llvm-6.0-dev libclang-6.0-dev python zlib1g-dev \
  libelf-dev
