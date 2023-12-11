#!/bin/bash

set -x

cd "$(dirname "${0}")"
ls /usr/lib/jvm/
export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk.arm64"
export CPPFLAGS="-I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
cd libjpeg-turbo
autoreconf -fiv
mkdir build
cd build
../configure --with-java
make
