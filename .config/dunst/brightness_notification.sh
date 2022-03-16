#!/bin/bash

# Brightness Control Notification
# dependences: brightnessctl, dunst

# brightness_ctl()
# BNESS="$(brightnessctl get)"
# MAX="$(brightnessctl max)"
# PERC="$((BNESS*100/MAX))"
# BLIGHT=${PERC%.*}

PERC="$(brightnessctl i | head -n 2 | tail -n 1 | cut -d '(' -f2 | sed 's/)$//')"
BLIGHT=$(brightnessctl i | head -n 2 | tail -n 1 | cut -d '(' -f2 | sed 's/%)$//')

if [[ $1 == "--inc" ]]; then
    notify-send -t 1500 --hint=string:synchronous:brightness -i high-brightness "Brightness: $PERC" -h int:value:$BLIGHT -u low --hint=int:transient:1
elif [[ $1 == "--dec" ]]; then
    notify-send -t 1500 --hint=string:synchronous:brightness -i low-brightness "Brightness: $PERC" -h int:value:$BLIGHT -u low --hint=int:transient:1
fi





