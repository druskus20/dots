#!/bin/sh
# from https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/cron/cronbat

# Notify me with notify-send if my battery is below 20%.
# You can set this to run via cron.

[ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ] && exit
[ "$(cat /sys/class/power_supply/BAT0/capacity)" -lt 20 ] &&
notify-send -u critical "Battery critically low."
