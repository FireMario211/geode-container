#!/bin/bash

sudo apt-get update
sudo apt-get -y install wget software-properties-common gnupg
# i shouldnt NEED to do this but the latest ver on ubuntu is clang-14!?
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 17
sudo apt-get update
sudo apt-get -y install unzip pip ninja-build
sudo apt install -y git clang-17 clang-tools-17 lld-17
pip install cmake --upgrade # because for whatever reason it installs an outdated version, ig source repos arent up to date!

wget https://github.com/geode-sdk/cli/releases/download/v3.2.0/geode-cli-v3.2.0-linux.zip
unzip geode-cli-v3.2.0-linux.zip
chmod +x geode
sudo mv geode /usr/local/bin/
rm geode-cli-v3.2.0-linux.zip

wget https://dl.google.com/android/repository/android-ndk-r27-linux.zip
sudo unzip -q android-ndk-r27-linux.zip -d /opt
sudo mv /opt/android-ndk-r27 /opt/android-ndk
rm android-ndk-r27-linux.zip
export ANDROID_NDK_ROOT=/opt/android-ndk

geode sdk install ~/geode
export GEODE_SDK=~/geode
geode sdk install-binaries -p android32
geode sdk install-binaries -p android64

sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

echo "export ANDROID_NDK_ROOT=/opt/android-ndk" >> ~/.bashrc
echo "export GEODE_SDK=~/geode" >> ~/.bashrc
