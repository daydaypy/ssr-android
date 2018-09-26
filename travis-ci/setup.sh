#!/bin/bash

export ARCH=`uname -m`
export ANDROID_NDK_HOME=$HOME/.android/android-ndk-r12b
export ANDROID_HOME=$HOME/.android/android-sdk-linux
export PATH=${ANDROID_NDK_HOME}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${PATH}

if [ ! -d "$ANDROID_HOME" ]; then
    mkdir -p $ANDROID_HOME
    pushd $HOME/.android
    wget -q https://dl.google.com/android/repository/tools_r25.0.2-linux.zip
    unzip -q tools_r25.0.2-linux.zip -d $HOME/.android/android-sdk-linux
    popd
fi

if [ ! -d "$ANDROID_NDK_HOME" ]; then
    mkdir -p $ANDROID_NDK_HOME
    pushd $HOME/.android
    wget -q http://dl.google.com/android/repository/android-ndk-r12b-linux-${ARCH}.zip
    unzip -q android-ndk-r12b-linux-${ARCH}.zip
    popd
fi

( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk --filter tools,platform-tools,build-tools-25.0.2,android-25,extra-google-m2repository --no-ui -a
( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk --filter extra-android-m2repository --no-ui -a
