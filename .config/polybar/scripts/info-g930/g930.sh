#!/bin/sh

BATTERY_PERCENTAGE=$(g930-battery-percentage)
HEADPHONE_SYMBOL="\uf7cd"
ALL_INPUT_DEVICES=$(pactl list short sinks | cut  -f 2)
G930='G930'

if [ -z "${ALL_INPUT_DEVICES##*$G930*}" ] ;
    then    
    echo -e "$HEADPHONE_SYMBOL $BATTERY_PERCENTAGE"
fi