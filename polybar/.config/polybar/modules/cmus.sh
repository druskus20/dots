#!/bin/sh
# Displays information about the song which is currently running in cmus

prepend_zero () {
    seq -f "%02g" "$1" "$1"
}

status=$(cmus-remote -C status)
[ -z "$status" ] && echo "" && exit 
[ "$(echo "$status" | sed -n 1p)" = "status stopped" ] && echo "Not playing" && exit

artist=$(echo "$status" | grep artist -m 1| cut -c 12-)
song=$(echo "$status" | grep title | cut -c 11-)
  
position=$(echo "$status" | grep position | cut -c 10-)
minutes1=$(prepend_zero $((position / 60)))
seconds1=$(prepend_zero $((position % 60)))
 
duration=$(echo "$status" | grep duration | cut -c 10-)
minutes2=$(prepend_zero $((duration / 60)))
seconds2=$(prepend_zero $((duration % 60)))

echo "$artist  -  $song [$minutes1:$seconds1 / $minutes2:$seconds2]" 
