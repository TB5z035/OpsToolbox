#!/bin/bash
DEFAULT=$*
TEXT=${DEFAULT:-"knock knock"}
# Slack
curl -X POST --data-urlencode "payload={\"channel\": \"#notification\", \"username\": \"webhookbot\", \"text\": \"$TEXT\", \"icon_emoji\": \":bulb:\"}" $HOOK_URL > /dev/null 2>&1
# Feishu
curl -X POST -H "Content-Type: application/json" -d `{"msg_type":"text","content":{"text":"$TEXT"}}`
