#!/bin/bash
set -x
set -e

apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin -P /tmp
mv /tmp/cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | tee /etc/apt/sources.list.d/cuda.list
apt-get update
apt-get -y install cuda-drivers

echo "export PATH=/usr/local/cuda-11.5/bin${PATH:+:${PATH}}" > /etc/profile
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.5/lib64\${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" > /etc/profile
