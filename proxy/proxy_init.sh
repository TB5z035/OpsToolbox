#!/bin/bash
set -x 
set -e

CONFIG_DIR=${CONFIG_DIR:-/etc/v2ray}

PORT=50000
docker pull v2fly/v2fly-core
docker run -d --name v2ray -v $CONFIG_DIR:/etc/v2ray -p $PORT:50000 -p $PORT:50000/udp v2fly/v2fly-core v2ray run -config=/etc/v2ray/config.json
