#!/bin/sh

MONITOR_NAME="$1"
if [ -z "$MONITOR_NAME" ]; then
    echo "Error no monitor name provided"
    exit 1
fi

echo "Toggling scale for monitor $MONITOR_NAME"
current_scale=$(niri msg -j outputs | jq -r '."'"$MONITOR_NAME"'"."logical"."scale"')

if [ "$current_scale" = "1.0" ]; then
  niri msg output "$MONITOR_NAME" scale 1.5
elif [ "$current_scale" = "1.5" ]; then
  niri msg output "$MONITOR_NAME" scale 0.75
else
  niri msg output "$MONITOR_NAME" scale 1.0
fi

if [ "$?" -ne 0 ]; then
    echo "Error setting scale"
    exit 1
fi

eww r

