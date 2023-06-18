#!/bin/bash

TEXT=${*:-"hello, world"}
curl -X POST -H "Content-Type: application/json" \
    -d "{\"msg_type\":\"text\",\"content\":{\"text\":\"$TEXT\"}}" \
    ${FEISHU_HOOK_URL} > /dev/null 2>&1