#!/bin/bash
set -e
set -x

if [ -f /etc/apt/sources.list ]; then
    mv /etc/apt/sources.list /etc/apt/sources.list.bak
fi
cp ./sources/sources.list /etc/apt/sources.list
apt-get update