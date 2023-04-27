#!/usr/bin/env bash

# hint:
# sleep 2; sway-prop

TMP=/tmp/sway-prop-$PID.tmp

trap "rm $TMP" EXIT

swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true)' > $TMP

if [[ -t 1 ]]; then
    cat $TMP
else
    # I prefer to popup a terminal eg:
    #mrxvt -e bash -c "less $TMP"
    # ... but sway doesn't have anything like i3-sensible-terminal.
    # swaynag is always installed with sway, so:
    swaynag -l -m sway-prop < $TMP
fi
