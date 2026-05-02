#! /usr/bin/bash

# Copyright 2021-2023 Ryan Hirasaki
#
# This file is part of OpenSDK
#
# OpenSDK is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# OpenSDK is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with OpenSDK; see the file COPYING. If not see
# <http://www.gnu.org/licenses/>.

# This script is only to cleanup the sysroot and normalize
# and differences in the filesystem layout that exist between
# Debian and Systemcore/Buildroot. Systemcore/Buildroot
# extensively uses symlinks in its sysroot, but our environments
# make symlinks tricky, so we need to manually relocate some
# libraries to ensure they can be found by the toolchain. We
# also want to mimimize the number of relocations to avoid
# future maintainence issues and to minimize the risk of error.


source "$(dirname "$0")/common.sh"

xcd "${BUILD_DIR}/sysroot-install/${TARGET_TUPLE}/sysroot"

if [ "${TARGET_DISTRO}" = "systemcore" ]; then
    # Required for <bits/c++config.h> to be in the right spot
    mv "usr/include/c++/${V_GCC/.*/}/aarch64-buildroot-linux-gnu/bits"/* "usr/include/c++/14/bits/"
    mv "usr/include/c++/${V_GCC/.*/}/aarch64-buildroot-linux-gnu/ext"/* "usr/include/c++/14/ext/"
    # libc.so, libm.a, libm.so all use linker scripts that use absolute paths to refer to libraries
    # We want to copy the least number of libraries, so it would be good to move everything once to
    # a place that will require the least number of libraries to be relocated. Of the libraries that
    # appear, /lib64 and /usr/lib64 show up the most (3 times). We will choose /lib64 due to it being
    # shorter, which may help with Windows path length later.
    # First, move everything we can before renaming stuff
    mkdir -p lib
    mkdir -p usr/lib64
    mv usr/lib/ld-linux-aarch64.so.1 lib/ld-linux-aarch64.so.1
    mv usr/lib/libm-2.42.a usr/lib64/libm-2.42.a
    mv usr/lib/libmvec.a usr/lib64/libmvec.a
    mv usr/lib/libc_nonshared.a usr/lib64/libc_nonshared.a
    # Relocate everything
    mv usr/lib lib64
    # Move gcc/aarch64-linux-gnu directory back
    mkdir -p usr/lib
    mv lib64/gcc usr/lib/gcc
else
    rm -rf usr/lib/audit
    rm -rf usr/lib/bfd-plugins
    rm -rf usr/lib/compat-ld
    rm -rf usr/lib/gold-ld
    rm -rf usr/lib/ldscripts
    rm -rf usr/lib/mime
    rm -rf usr/lib/tar
fi
