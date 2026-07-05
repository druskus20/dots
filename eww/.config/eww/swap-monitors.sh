#!/bin/sh
CFG="$HOME/.config/eww/eww.yuck"

# Swap :monitor 0 <-> 1 on win3 and win4
sed -i '
  /defwindow win3/s/:monitor 0/:monitor TEMP/;  /defwindow win3/s/:monitor 1/:monitor 0/;  /defwindow win3/s/:monitor TEMP/:monitor 1/
  /defwindow win4/s/:monitor 0/:monitor TEMP/;  /defwindow win4/s/:monitor 1/:monitor 0/;  /defwindow win4/s/:monitor TEMP/:monitor 1/
' "$CFG"

eww kill
eww open-many win3 win4
