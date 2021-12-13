#!/bin/bash
set -x 
set -e

PORT=50000
docker pull v2fly/v2fly-core
docker run -d --name v2ray -v /etc/v2ray:/etc/v2ray -p $PORT:$PORT v2fly/v2fly-core v2ray -config=/etc/v2ray/config.json
