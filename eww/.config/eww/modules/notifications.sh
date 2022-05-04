#!/bin/sh

print_notification() {
  content=$(echo "$1" | tr '\n' ' ')
  content="(label :limit-width 50 :text '$content')"
  echo "{\"show\": \"$2\", \"content\": \"$content\"}"
}

print_notification "" "no"
tiramisu -o '#summary' | while read -r line; do 
  print_notification "$line" "yes"
  kill "$pid" > /dev/null 2>&1
  (sleep 10; print_notification "" "no") &
  pid="$!"
done
