#!/bin/bash
while true
do
    echo "$(date '+%Y-%m-%d %H:%M') $(cat /sys/class/power_supply/BAT0/capacity) $(cat /sys/class/power_supply/BAT1/capacity) $(cat /sys/class/power_supply/AC/online)" >> ~/.log/battery
    sleep 4
done
