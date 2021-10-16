#! /usr/bin/env bash

# Core flags
CFLAGS="$CFLAGS -Os -g0"
CXXFLAGS="$CXXFLAGS -Os -g0"
if [ "$WPI_HOST_NAME" = "Mac" ]; then
    # Clang has a lower bracket depth than what GCC may have
    CFLAGS+=" -fbracket-depth=512"
    CXXFLAGS+=" -fbracket-depth=512"
    
    # Clang complains if you are building C code with the C++ compiler 
    CXXFLAGS+=" -Wno-deprecated"

    # MacOS builds use Clang so changes need to me made to quite the logs
    CFLAGS+=" -Wno-array-bounds -Wno-mismatched-tags -Wno-unknown-warning-option"
    CXXFLAGS+=" -Wno-array-bounds -Wno-mismatched-tags -Wno-unknown-warning-option"

    # MacOS/Clang does not contain ioctl in expected header? GDB Fails
    CFLAGS+=" -Wno-implicit-function-declaration"
    CXXFLAGS+=" -Wno-implicit-function-declaration"

    # Change visibility to make linker happy
    CFLAGS+=" -fvisibility=default"
    CXXFLAGS+=" -fvisibility=default"
fi
export CFLAGS CXXFLAGS

# Make-server processes
JOBS="$(nproc --ignore=1)"
is-actions && JOBS="6" # Use the same across all actions
export JOBS
