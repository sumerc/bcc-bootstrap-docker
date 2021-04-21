#!/bin/bash

set -eu

cd /opt

git clone https://github.com/iovisor/bcc.git
mkdir bcc/build; cd bcc/build
cmake ..
make
make install
cmake -DPYTHON_CMD=python3 .. # build python3 binding
pushd src/python/
make
make install
popd
