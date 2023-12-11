#!/bin/bash

set -x

cd "$(dirname "${0}")"
export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk.x86_64"
export CPPFLAGS="-I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
apt-get -q install -y gcc make gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu
export CC=aarch64-linux-gnu-gcc
cd libjpeg-turbo
autoreconf -fiv
mkdir build
cd build
# https://github.com/CGDogan/libjpeg-turbo-java/new/master
../configure --with-java --build x86_64-pc-linux-gnu --host aarch64-linux-gnu LDFLAGS="-static"
make
