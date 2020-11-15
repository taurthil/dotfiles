#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# polybar bottom &
polybar --reload info &
# polybar --reload info -c ~/.config/polybar/config.ini &

# Launch polybar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
    # MONITOR=$m polybar --reload main -c ~/.config/polybar/config.ini &
  done
else
  # polybar --reload monitor1 &
  polybar --reload -c main &
  # polybar --reload main -c ~/.config/polybar/config.ini &
fi
