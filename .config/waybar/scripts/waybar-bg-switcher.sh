#!/usr/bin/env bash

THEMEPATH="$HOME/.config/waybar/themes"
NEWBGFILE="rounded_maniac_bg.css"

# Create the file if it doesn't exist
[[ ! -f "$THEMEPATH/$NEWBGFILE" ]] && touch "$THEMEPATH/$NEWBGFILE"

# Keep current window state
ISFLOATING=$(hyprctl activewindow | grep floating | head -n 2 | tail -n 1 | cut -d ' ' -f2)

# if current window is floating, make the background transparent
[[ "$ISFLOATING" -eq 1 ]] && bgColor="transparent" || bgColor="rgba(2,2,33,0.1)"

cat <<EOF > "$THEMEPATH/$NEWBGFILE"
window#waybar {
    background-color: $bgColor;
}
EOF
