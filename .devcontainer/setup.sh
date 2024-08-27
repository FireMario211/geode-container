#!/bin/bash

sudo apt-get update
sudo apt-get install -y clang-17 clang-tools-17 lld-17 wget unzip

wget https://github.com/geode-sdk/cli/releases/download/v3.2.0/geode-cli-v3.2.0-linux.zip
unzip geode-cli-v3.2.0-linux.zip
sudo mv geode /usr/local/bin/
rm geode-cli-v3.2.0-linux.zip

wget https://github.com/Jake-Shadle/xwin/releases/download/0.6.5/xwin-0.6.5-x86_64-unknown-linux-musl.tar.gz
tar -xzf xwin-0.6.5-x86_64-unknown-linux-musl.tar.gz
sudo mv xwin-0.6.5-x86_64-unknown-linux-musl/xwin /usr/local/bin/
rm -rf xwin-0.6.5-x86_64-unknown-linux-musl
rm xwin-0.6.5-x86_64-unknown-linux-musl.tar.gz

mkdir -p ~/xwin
mkdir -p ~/xwin/splat
cd ~/xwin
xwin --arch x86_64 --accept-license splat --include-debug-libs --output splat

git clone https://github.com/matcool/clang-msvc-sdk.git toolchain

sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

mkdir ~/geode
export GEODE_SDK = ~/geode
geode install ~/geode
geode install-binaries
