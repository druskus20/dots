#!/bin/sh

while :; do
    energy_full=""
    energy_now=""
    charge=""
    for bat in /sys/class/power_supply/*/capacity; do
        bat="${bat%/*}"
        read -r full < $bat/energy_full
        read -r now < $bat/energy_now
        energy_full=$((energy_full + full))
        energy_now=$((energy_now + now))
    done
    if cat /sys/class/power_supply/*/status | grep -q Charging; then
        charge=+
    fi
    printf '%s %s' "$charge$((energy_now * 100 / energy_full))%" "$(date +'%H:%M')"
    sleep 3
done
