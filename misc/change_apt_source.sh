#!/bin/bash
set -e
set -x

mv /etc/apt/sources.list /etc/apt/sources.list.bak
cp ./sources/sources.list /etc/apt/sources.list
apt-get update