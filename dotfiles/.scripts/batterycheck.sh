#!/bin/bash
#
# low battery warning
#

THRESHOLD=15
BATTERY=/sys/class/power_supply/BAT0
CHARGING=$(cat /sys/class/power_supply/AC/online)

if [[ CHARGING ]]; then
    echo "Charging, stopping early..."
    exit 0
fi

REM=`grep "POWER_SUPPLY_CHARGE_NOW" $BATTERY/uevent | awk -F= '{ print $2 }'`
FULL=`grep "POWER_SUPPLY_CHARGE_FULL_DESIGN" $BATTERY/uevent | awk -F= '{ print $2 }'`
PERCENT=`echo $(( $REM * 100 / $FULL ))`

if [ $PERCENT -le "$THRESHOLD" ]; then
    echo "Low battery, threshold: $THRESHOLD, level: $PERCENT"
    notify-send "Battery low!" -u critical
fi
