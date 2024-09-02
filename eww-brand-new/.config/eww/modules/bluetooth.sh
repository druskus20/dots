#!/bin/bash

#!/bin/bash

# Get the list of connected Bluetooth devices and join their names with a comma separator
connected_devices=$(bluetoothctl devices | cut -f2 -d' ' | xargs -I{} bluetoothctl info {} | \
awk '
    /Device/ { device=$2 }
    /Name/ { name=$2; for (i=3; i<=NF; i++) name=name" "$i }
    /Connected: yes/ { if (devices != "") devices=devices", "name; else devices=name }
    END { print devices }
')

if [[ -n "$connected_devices" ]]; then
  echo "{\"connected\": true, \"devices\": \"$connected_devices\"}"
else
  echo "{\"connected\": false, \"devices\": \"\"}"
fi

