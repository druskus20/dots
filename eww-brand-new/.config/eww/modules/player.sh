#!/bin/bash

# Subscribe to playerctl events and update the status on change
playerctl --player=spotify,vlc,chromium metadata --format '{"status": "{{ status }}", "title": "{{ title }} - {{ artist }}"}' --follow | while read -r line; do
  if [[ "$line" == "gone*" || "$line" == "" ]]; then
    echo "{\"status\": \"No players found\", \"title\": \"\"}"
  elif [[ "$line" == "No players found" ]]; then
    echo "{\"status\": \"No players found\", \"title\": \"\"}"
  else
    echo "$line"
  fi
done
