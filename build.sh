#!/bin/bash
#wsl
#set ndk root first, download from https://developer.android.com/ndk/downloads
#execute build/tools/make_standalone_toolchain.py     --arch arm --api 21 --install-dir $ANDROID_NDK_ROOT/toolchains/arm-linux
#install perl using sudo apt install perl (skip if already installed)
ANDROID_NDK_ROOT=/mnt/d/Programs/Android/Linux/android-ndk-r21e/ 
#ANDROID_NDK_ROOT=/mnt/d/Programs/Android/Linux/android-ndk-r26/ 
##ANDROID_NDK_ROOT=/home/kouryuu/android-ndk-r26/ 
export ANDROID_NDK=$ANDROID_NDK_ROOT

#set api version according to your downloaded platform
_ANDROID_API_VER="21"

source ./setenv-android.sh
INSTALL_DIR=$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/$host/sysroot/usr/

#./configure android-armeabi shared no-ssl2 no-ssl3 no-comp no-hw no-engine --openssldir=$INSTALL_DIR --prefix=$INSTALL_DIR 
./configure android-arm64 shared no-ssl2 no-ssl3 no-comp no-hw no-asm no-engine --openssldir=$INSTALL_DIR --prefix=$INSTALL_DIR

dos2unix include/internal/*.h && dos2unix include/crypto/*.h && dos2unix include/openssl/*.h 

make clean		#in-case switching architecture ex: from arm to aarch64
make depend
make all
make install

#cp $INSTALL_DIR/lib/*.so $INSTALL_DIR/lib/aarch64-linux-androideabi/$_ANDROID_API_VER/