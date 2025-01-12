#!/usr/bin/bash

vol="$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))"
date="$(date +'%Y-%m-%d %X')"
batt="$(cat /sys/class/power_supply/macsmc-battery/capacity)%"
batt_stat="$(cat /sys/class/power_supply/macsmc-battery/status)"
current_brightness=$(cat /sys/class/backlight/apple-panel-bl/brightness)
max_brightness=$(cat /sys/class/backlight/apple-panel-bl/max_brightness)
brightness=$(echo "scale=2 ; $current_brightness / $max_brightness" | bc)
echo $batt_stat "  vol:" $vol "  batt:" $batt "  br:" ${brightness#"."}% " "$date"  " | tr '[:upper:]' '[:lower:]'
