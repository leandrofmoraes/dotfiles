#! /usr/bin/env bash

# Modified Script for Google Search
# Original Submitted by https://github.com/LeventKaanOguz

# Opens rofi in dmenu mod and waits for input. Then pushes the input to the query of the URL.

# Uses a custom configuration based on window manager
[[ "$XDG_CURRENT_DESKTOP" ]] ||
[[ $(type wmctrl) ]] && desktop=$(wmctrl -m | grep Name | cut -d ' ' -f 2)

case $desktop in
    "Hyprland")
        rofi_config="$HOME/.config/rofi/themes/hypr_search_bar.rasi" ;;
    "bspwm" | "Bspwm")
        rofi_config="$HOME/.config/rofi/themes/search_bar.rasi" ;;
    *)
        rofi_config="$HOME/.config/rofi/themes/hypr_search_bar.rasi" ;;
esac

# Kill Rofi if already running before execution
if pgrep -x "rofi" >/dev/null; then
    pkill rofi
    #exit 0
fi

# Open rofi with a dmenu and pass the selected item to xdg-open for Google search
echo "" | rofi -dmenu -theme "$rofi_config" -p "Google:" | xargs -I{} xdg-open "https://www.google.com/search?q={}"

