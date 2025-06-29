#!/bin/bash
# __        ______    _____             _
# \ \      / /  _ \  | ____|_ __   __ _(_)_ __   ___
#  \ \ /\ / /| |_) | |  _| | '_ \ / _` | | '_ \ / _ \
#   \ V  V / |  __/  | |___| | | | (_| | | | | |  __/
#    \_/\_/  |_|     |_____|_| |_|\__, |_|_| |_|\___|
#                                 |___/
#
# This script initializes the wallpaper engine based on the user's configuration.

transition_type="wipe" # none │ simple │ fade │ left │ right │ top │ bottom │ wipe │ wave │ grow │ center │ any │ outer │ random

wallpaper_engine=$(cat $HOME/.config/ml4w/settings/wallpaper-engine.sh)
if [ "$wallpaper_engine" == "swww" ]; then
    # swww
    echo ":: Using swww"
    swww init
    swww-daemon --format xrgb
    sleep 0.5
    swww img $wallpaper --transition-type=$transition_type --transition-duration=0.7
    # swww img $HOME/.config/hypr/wallpaper.jpg \
    #   --transition-type=wipe \
    #   --transition-duration=0.7 \
    #   --transition-fps=60 \
    #   --transition-pos="$(hyprctl cursorpos)"
elif [ "$wallpaper_engine" == "hyprpaper" ]; then
    # hyprpaper
    echo ":: Using hyprpaper"
    sleep 0.5
    ~/.config/hypr/scripts/SwitchWallpaper.sh $wallpaper
fi
