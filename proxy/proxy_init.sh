#!/bin/bash
set -x 
set -e


CONFIG_DIR=${CONFIG_DIR:-$(pwd)/proxy/config}

PORT=50000
docker pull v2fly/v2fly-core:v5.1.0
docker run -d --name v2ray -v $CONFIG_DIR:/etc/v2ray -p $PORT:50000 -p $PORT:50000/udp v2fly/v2fly-core:v5.1.0 run -c /etc/v2ray/config.json
