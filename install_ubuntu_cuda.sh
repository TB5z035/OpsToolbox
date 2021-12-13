#!/bin/bash
set -e
set -x

distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
version=11.4
add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/ /"
apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/${distribution}/x86_64/7fa2af80.pub
wget https://developer.download.nvidia.com/compute/cuda/repos/${distribution}/x86_64/cuda-${distribution}.pin -P /tmp
mv /tmp/cuda-${distribution}.pin /etc/apt/preferences.d/cuda-repository-pin-600
apt-get update
apt-get install -y cuda
