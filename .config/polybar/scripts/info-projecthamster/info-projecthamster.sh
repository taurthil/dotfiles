#!/bin/sh

ACTIVITY=$(hamster current 2> /dev/null | cut -d " " -f 3- | sed 's/@.* / - /')
DAY_SPENT=$(hamster list $(date +'%m-%d-%Y') | grep "Total:" | awk '{print substr($2, 1, length($2)-1)}')
HAMSTER_SYMBOL="\uf56a"
if [ ! -z "$DAY_SPENT" ]; 
then
    if [ $DAY_SPENT = 0 ]; then
        COLOR='cc575d'
    else
        HAMSTER_SYMBOL="\u"$(awk 'BEGIN { print ('$DAY_SPENT' >= 6) ? "e389" : "fa19" }')
        COLOR=$(awk 'BEGIN { print ('$DAY_SPENT' >= 6) ? "96c773" : "e5c07b" }')
    fi
else
    COLOR='cc575d'
fi

if [ -n "$ACTIVITY" ]; then
    echo -e "%{u#$COLOR}%{+u}%{F#$COLOR}$HAMSTER_SYMBOL%{F-} $ACTIVITY"
else
    if [ $DAY_SPENT = 8 ]; 
    then
        echo -e "%{u#$COLOR}%{+u}%{F#$COLOR}$HAMSTER_SYMBOL%{F-} Well Done"
    else
        echo -e "%{u#$COLOR}%{+u}%{F#$COLOR}$HAMSTER_SYMBOL%{F-} No Activity"   
    fi
fi
