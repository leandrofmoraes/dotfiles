#! /usr/bin/env bash

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

# Check if ".my_aliases" file exists
# [[ -f ~/.my_aliases ]] && my_aliases="$HOME/.my_aliases"

# or use the aliases from the current shell
# my_aliases="$(alias | awk -F'[ =]' '{print $1}')"

# Run Rofi with a run-list-command and pass the selected item to zsh
# Reference: "https://hisfantor.com/blog/linux/2018/03/22/rofi-n-stuff.html"
# rofi -run-list-command ". $my_aliases" -run-command "/usr/bin/zsh -i -c '{cmd}'" -show run -disable-history -theme "$rofi_config"
# rofi -run-list-command ". $my_aliases" -run-command "/usr/bin/zsh -i -c '{cmd}'" -show run -theme "$rofi_config"

# rofi -run-command "zsh -ic '{cmd}'" -show run -disable-history -theme "$rofi_config"
rofi -run-command "zsh -ic '{cmd}'" -show run -theme "$rofi_config"
