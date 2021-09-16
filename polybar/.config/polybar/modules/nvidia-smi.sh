#!/bin/sh

result="$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2> /dev/null)"
[ "$result" = "Failed" ] && echo "Failed" && exit
echo "$result%" || echo ""

