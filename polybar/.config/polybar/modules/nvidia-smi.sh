#!/bin/sh

nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2> /dev/null | awk '{ print ""$1"","%"}' | sed s/" %"/%/ || echo ""

