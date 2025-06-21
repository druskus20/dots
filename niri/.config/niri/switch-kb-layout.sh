#!/bin/bash

niri msg action switch-layout next
notify-send "Switched keyboard layout to: " "$(niri msg keyboard-layouts | grep '^\s*\*' | awk '{print $3}')"

