#!/bin/sh



ACTIVITY=$(hamster current 2> /dev/null | cut -d " " -f 3- | sed 's/@.*//')

STATUS=$(i3-gnome-pomodoro status)
TIME_SYMBOL="\uf56a"
BREAK="Break"
PAUSED="PAUSED"
POMODORO="Pomodoro"

if [ ! -z "$STATUS" ];
then
    if [ -z "${STATUS##*$BREAK*}" ] ;
    then
        COLOR='cc575d'
        TIME_SYMBOL="\ufa1d"
        STATUS=$( i3-gnome-pomodoro status | sed -e "s/^$BREAK//" | xargs )
    elif [ -z "${STATUS##*$PAUSED*}" ] ;
    then
        COLOR='e5c07b'
        TIME_SYMBOL="\ufa1a"
        STATUS=$( i3-gnome-pomodoro status | sed -e "s/^$POMODORO//" -e "s/$PAUSED//" | xargs)
    elif [ -z $( i3-gnome-pomodoro status | sed -e 's/[^0-9]*//g') ] ; 
    then
        COLOR='D3DAE3'
    else
        COLOR='96c773'
        STATUS=$( i3-gnome-pomodoro status | sed -e "s/^$POMODORO//" | xargs )
    fi
    if [ ! -z "$ACTIVITY" ]; 
    then
        echo -e "%{F#$COLOR}$TIME_SYMBOL $ACTIVITY ${STATUS}%{F-}"
    else
        echo -e "%{F#$COLOR}$TIME_SYMBOL ${STATUS}%{F-}"
    fi
fi