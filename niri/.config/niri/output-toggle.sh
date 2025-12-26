#!/bin/bash

OUTPUT="$1"


STATE=$(niri msg outputs | awk -v out="$OUTPUT" '
  $1=="Output" && $0 ~ "\\(" out "\\)" {found=1; next}
  found && $1=="Disabled" {print "disabled"; exit}
  found && $1=="Current" {print "enabled"; exit}
  found && $1=="Output" {exit}
')

if [ "$STATE" = "disabled" ]; then
    niri msg output "$OUTPUT" on
else
    niri msg output "$OUTPUT" off
fi

