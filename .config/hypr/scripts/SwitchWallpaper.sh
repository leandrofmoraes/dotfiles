#!/usr/bin/env bash
# Change wallpaper using hyprctl e hyprpaper

WALLPAPER_DIR="$HOME/Imagens/wallpapers/"
SELECTED_IMAGE=$1

change_wallpaper(){

  # hyprpaper is installed?
  if ! command -v hyprpaper > /dev/null; then
    echo "hyprctl is not installed"
    exit 1
  fi

  # jq is installed?
  if ! command -v jq > /dev/null; then
    echo "jq is not installed"
    exit 1
  fi

  local current_monitor=''
  current_monitor=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true) | .name')

  if [[ -z "$current_monitor" ]]; then
    echo "Error! could not determine the current monitor"
    exit 1
  fi

  hyprctl hyprpaper unload all 1> /dev/null
  hyprctl hyprpaper preload "$SELECTED_IMAGE" 1> /dev/null
  hyprctl hyprpaper wallpaper "$current_monitor,$SELECTED_IMAGE" 1> /dev/null
}

visual_selection(){

  cd "$WALLPAPER_DIR" || exit
  local fzf_options=""
  fzf_options="-m --reverse --preview '[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || ueberzugpp layer --scaler=lanczos --width=50% --height=50% --x=right --y=top {} || cat {}) 2> /dev/null | head -500'"

  SELECTED_IMAGE=$(eval "fzf $fzf_options")

  change_wallpaper || exit
}

# Argument is required
if [[ -z "$1" ]]; then
  visual_selection
else
  change_wallpaper
fi

