#!/bin/sh

# Outputs a different icon depending on the hostname

HOSTNAME=$(hostname)

[ -z "$HOSTNAME" ] && echo "" && exit
[ "$HOSTNAME" = "earth" ] && echo "" && exit
[ "$HOSTNAME" = "moon" ] && echo "" && exit
[ "$HOSTNAME" = "pi" ] && echo "" && exit

# Just in case
echo ""
