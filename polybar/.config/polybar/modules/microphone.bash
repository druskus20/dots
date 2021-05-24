#!/bin/bash

DEFAULT_SOURCE_INDEX=$(pacmd list-sources | grep "\* index:" | cut -d' ' -f5)

display_volume() {

	volume=$(pacmd list-sources | grep "index: $DEFAULT_SOURCE_INDEX" -A 7 | grep "volume" | awk -F/ '{print $2}')
	mute=$(pacmd list-sources | grep "index: $DEFAULT_SOURCE_INDEX" -A 11 | grep "muted")

	if [ -z "$volume" ]; then
	  echo "No"
	else
	  volume="${volume//[[:blank:]]/}" 
	  if [[ "$mute" == *"yes"* ]]; then
	    echo " $volume"
	  elif [[ "$mute" == *"no"* ]]; then
	    echo " $volume"
	  else
	    echo ""
	  fi
	fi
}


case $1 in
	"show-vol")
			display_volume
		;;
	"inc-vol")
			pactl set-source-volume "$DEFAULT_SOURCE_INDEX" +5%
			display_volume
		;;
	"dec-vol")

			pactl set-source-volume "$DEFAULT_SOURCE_INDEX" -5%
			display_volume
		;;
	"mute-vol")
			pactl set-source-mute "$DEFAULT_SOURCE_INDEX" toggle
			display_volume
		;;
	*)
		echo "Invalid script option"
		;;
esac
