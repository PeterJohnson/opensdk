#! /usr/bin/env bash

source "$(dirname "$0")/version.env" || exit
source "$(dirname "$0")/../../scripts/downloads_tools.sh" || exit

signed sig https://ftp.gnu.org/gnu/gcc/gcc-${V_GCC}/gcc-${V_GCC}.tar.gz
signed sig https://ftp.gnu.org/gnu/binutils/binutils-${V_BIN}.tar.bz2

basic-download https://ftp.gnu.org/gnu/gdb/gdb-${V_GDB}.tar.gz
POOL="http://archive.raspbian.org/raspbian/pool/main/"
basic-download $POOL/g/gcc-8/libgcc-8-dev_${Va_LIBGCC}_armhf.deb
basic-download $POOL/g/gcc-8/libatomic1_${Va_LIBSTDCPP}_armhf.deb
basic-download $POOL/g/gcc-8/libatomic1-dbg_${Va_LIBSTDCPP}_armhf.deb
basic-download $POOL/g/gcc-8/libstdc++6_${Va_LIBSTDCPP}_armhf.deb
basic-download $POOL/g/gcc-8/libstdc++6-8-dbg_${Va_LIBSTDCPP}_armhf.deb
basic-download $POOL/g/gcc-8/libstdc++-8-dev_${Va_LIBSTDCPP}_armhf.deb
basic-download $POOL/g/gcc-8/libasan5_${Va_LIBSTDCPP}_armhf.deb
basic-download $POOL/g/gcc-8/libasan5-dbg_${Va_LIBSTDCPP}_armhf.deb
basic-download $POOL/g/gcc-8/libgomp1_${Va_LIBSTDCPP}_armhf.deb
basic-download $POOL/g/gcc-8/libgomp1-dbg_${Va_LIBSTDCPP}_armhf.deb
basic-download $POOL/g/gcc-8/libubsan1_${Va_LIBSTDCPP}_armhf.deb
basic-download $POOL/g/gcc-8/libubsan1-dbg_${Va_LIBSTDCPP}_armhf.deb
basic-download $POOL/g/glibc/libc6_${Va_LIBC}_armhf.deb
basic-download $POOL/g/glibc/libc6-dbg_${Va_LIBC}_armhf.deb
basic-download $POOL/g/glibc/libc6-dev_${Va_LIBC}_armhf.deb
basic-download $POOL/l/linux/linux-libc-dev_${Va_LINUX}_armhf.deb
