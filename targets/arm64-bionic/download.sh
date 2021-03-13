#! /usr/bin/env bash

source "$(dirname "$0")/version.env" || exit
source "$(dirname "$0")/../../scripts/downloads_tools.sh" || exit

signed sig https://ftp.gnu.org/gnu/gcc/gcc-${V_GCC}/gcc-${V_GCC}.tar.gz
signed sig https://ftp.gnu.org/gnu/binutils/binutils-${V_BIN}.tar.bz2
signed sig https://ftp.gnu.org/gnu/gdb/gdb-${V_GDB}.tar.gz

package-debian g/gcc-8/libgcc1_${Va_LIBGCC}_arm64.deb
package-debian g/gcc-8/libgcc-8-dev_${Va_LIBGCC}_arm64.deb
package-debian g/gcc-8/libatomic1_${Va_LIBSTDCPP}_arm64.deb
package-debian g/gcc-8/libatomic1-dbg_${Va_LIBSTDCPP}_arm64.deb
package-debian g/gcc-8/libstdc++6_${Va_LIBSTDCPP}_arm64.deb
package-debian g/gcc-8/libstdc++-8-dev_${Va_LIBSTDCPP}_arm64.deb
package-debian g/gcc-8/libasan5_${Va_LIBSTDCPP}_arm64.deb
package-debian g/gcc-8/liblsan0_${Va_LIBSTDCPP}_arm64.deb
package-debian g/gcc-8/libtsan0_${Va_LIBSTDCPP}_arm64.deb
package-debian g/gcc-8/libgomp1_${Va_LIBSTDCPP}_arm64.deb
package-debian g/gcc-8/libubsan1_${Va_LIBSTDCPP}_arm64.deb
package-debian g/gcc-8/libitm1_${Va_LIBSTDCPP}_arm64.deb
package-debian g/glibc/libc6_${Va_LIBC}_arm64.deb
package-debian g/glibc/libc6-dev_${Va_LIBC}_arm64.deb
package-debian l/linux/linux-libc-dev_${Va_LINUX}_arm64.deb
