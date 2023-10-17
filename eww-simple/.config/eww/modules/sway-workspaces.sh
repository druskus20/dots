#!/usr/bin/env sh

name="$1" 

# only for output = eDP-1
filter="
  {
    active: .[] | select(.focused) | .name,
    list: [ .[] | select(.output == \"$name\") | .name ]
  }
  "
  swaymsg --type subscribe --monitor '[ "workspace" ]' |
    while read REPLY
    do swaymsg --type get_workspaces --raw | \
         stdbuf --output=0 jq --compact-output "$filter"
    done
