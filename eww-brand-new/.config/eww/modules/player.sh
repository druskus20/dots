#!/bin/bash

playerctl --player=spotify,vlc,chromium metadata --format '{"status": "{{ status }}", "title": "{{ title }} - {{ artist }}"}' --follow | while read -r line; do
  if [[ "$line" == "No player could handle this command" ]]; then
    echo "{\"status\": \"No players found\", \"title\": \"\"}"
  elif [[ "$line" == "gone*" || "$line" == "" ]]; then
    echo "{\"status\": \"No players found\", \"title\": \"\"}"
  elif [[ "$line" == "No players found" ]]; then
    echo "{\"status\": \"No players found\", \"title\": \"\"}"
  else
    # if the title / artist contains " it would break, hence we escape it
    status=$(echo "$line" | grep -oP '(?<=status": ")[^"]*')
    title_and_artist=$(echo "$line" | grep -oP '(?<=title": ")[^"]*')
    escaped_title_and_artist=$(echo "$title_and_artist" | sed 's/"/\\"/g')
    echo "{\"status\": \"$status\", \"title\": \"$escaped_title_and_artist\"}"
  fi
done

