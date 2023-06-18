#!/bin/bash
TEXT=${*:-"knock knock"}
curl -X POST --data-urlencode "payload={\"channel\": \"#notification\", \"username\": \"webhookbot\", \"text\": \"$TEXT\", \"icon_emoji\": \":bulb:\"}" $HOOK_URL > /dev/null 2>&1
