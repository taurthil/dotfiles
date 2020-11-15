#!/bin/bash

# see man zscroll for documentation of the following parameters
zscroll -l 30 \
        --delay 0.5 \
        --match-command "playerctl --player=playerctld status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0"  \
        --update-check true '/home/taurthil/.config/polybar/scripts/spotify-new/get_spotify_status.sh' &

wait
