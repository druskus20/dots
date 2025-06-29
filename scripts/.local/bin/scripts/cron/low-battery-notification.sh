#!/bin/sh
# from https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/cron/cronbat

# Notify me with notify-send if my battery is below 20%.
# You can set this to run via cron.

BATTERY_PATH="/sys/class/power_supply/BAT0"
THRESHOLD=20

[ "$(cat $BATTERY_PATH/status)" = "Charging" ] && exit 0

BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$BATTERY_LEVEL" -le $THRESHOLD ]; then

    # Find user session bus address - this helps specially in cron jobs
  export DISPLAY=:0
  export XDG_RUNTIME_DIR="/run/user/$(id -u)"
  export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

  notify-send -u critical "Battery critically low: $BATTERY_LEVEL%"
fi
