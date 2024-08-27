# Use this for compiling your mods. Copy this file over.
# If there are issues with executing it, such as permissions, use chmod +x build.sh

#!/bin/bash
export NDK=/opt/android-ndk
#ABIS=("armeabi-v7a" "arm64-v8a")
ABIS=("arm64-v8a") # android 64 is default
#ABIS=("armeabi-v7a")
export MINSDKVERSION=23

mkdir -p build-android
for ABI in "${ABIS[@]}"; do
   cmake -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake \
         -DANDROID_ABI=$ABI -DANDROID_PLATFORM=android-$MINSDKVERSION \
         -DCMAKE_BUILD_TYPE=RelWithDebInfo -DGEODE_DEBUG=1 -DGEODE_DONT_INSTALL_MODS=1 \
         -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DGEODE_DISABLE_FMT_CONSTEVAL=1 -G Ninja \
         -B build-android/$ABI
   cmake --build build-android/$ABI --config RelWithDebInfo
done