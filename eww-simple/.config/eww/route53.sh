#!/bin/bash
cmd="dig @8.8.8.8  ip-192-168-1-2.local.elkpowered.com"
expected="192.168.1.2"
output=$($cmd | grep -A 1 "ANSWER SECTION" | grep -v "ANSWER SECTION" | awk '{print $5}')

change="false"
if [[ $output != $expected ]]; then
  notify-send "Change! DNS behaving unexpectedly"
  change="true"
fi


echo '{"status":'\"$output\"',"change":'\"$change\"'}'
