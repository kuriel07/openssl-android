#wsl
ANDROID_NDK_ROOT=/mnt/d/Programs/Android/Linux/android-ndk-r21e/ 
export ANDROID_NDK=$ANDROID_NDK_ROOT

source ./setenv-android.sh
./configure android-armeabi shared no-ssl2 no-ssl3 no-commakep no-hw no-engine      --openssldir=/mnt/d/Git/AndroidSSL/openssl/$ANDROID_API --prefix=/mnt/d/Git/AndroidSSL/openssl/$ANDROID_API 

dos2unix include/internal/*.h
dos2unix include/crypto/*.h 
dos2unix include/openssl/*.h 

make depend
make all
make install