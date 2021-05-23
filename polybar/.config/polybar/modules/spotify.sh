#!/bin/sh

pgrep -x spotify > /dev/null || { echo "" && exit; } 

domain="org.mpris.MediaPlayer2"

meta=$(dbus-send --print-reply --dest=${domain}.spotify \
  /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:${domain}.Player string:Metadata 2> /dev/null)

artist=$(echo "$meta" | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' | tail -1  | sed -e 's/\&/\\&/g' -e 's#\/#\\/#g')
album=$(echo "$meta" | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1| sed -e 's/\&/\\&/g' -e 's#\/#\\/#g')
title=$(echo "$meta" | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1 | sed -e 's/\&/\\&/g' -e 's#\/#\\/#g')

[ -z "$artist" ] || [ -z "$title" ] && { echo "" && exit; }
echo "${*:-%artist% - %title%}" | sed "s/%artist%/$artist/g;s/%title%/$title/g;s/%album%/$album/g"i | sed -e "s/\&/\&/g" -e "s#\/#\/#g"


