#!/bin/bash

# wpmgr.sh - Wallpaper Manager Script
# This script initialize a wallpaper engine and sets a wallpaper.
# It supports both swww and hyprpaper as wallpaper engines.
#
# Author: Leandro F. Moraes
#
# Usage:

CONFIG_DIR="$HOME/.config/settings"
CONFIG_FILE="$CONFIG_DIR/wpmgr.config"
CACHE_DIR="$HOME/.cache/wpmgr"
WALLPAPERS_DIR="$HOME/Imagens/wallpapers"

[ -d $CACHE_DIR ] || mkdir -p $CACHE_DIR

# is swww installed?
check_engine_installed() {
    if command -v swww &> /dev/null; then
        echo "swww"
    elif command -v hyprpaper &> /dev/null; then
        echo "hyprpaper"
    else
        echo "none"
    fi
}

DEFAULT_ENGINE=$(check_engine_installed)
[ "$DEFAULT_ENGINE" == "none" ] && echo "No wallpaper engine found. Please install swww or hyprpaper." && exit 1

if [ ! -f "$CONFIG_FILE" ]; then
  [ -d "$CONFIG_DIR" ] || mkdir -p "$CONFIG_DIR"

  [ -d "$WALLPAPERS_DIR" ] || mkdir -p "$HOME/Imagens/wallpapers"

  cat << EOF > "$CONFIG_FILE"
  ### wpmgr.config - Wallpaper Manager Configuration

  ## Walpaper engine (swww or hyprpaper)
  # wallpaper_engine=""

  ## Directory containing wallpapers
  wallpapers_dir="~/Imagens/wallpapers"

  ## Transition type for swww ( none │ simple │ fade │ left │ right │ top │ bottom │ wipe │ wave │ grow │ center │ any │ outer │ random )
  transition_type="none"

  ## Transition duration in seconds
  transition_duration=0.7

  ## Transition position for swww ( x y )
  # transition_pos="0 0"

  EOF
  echo "wpmgr configuration file created at $CONFIG_FILE"
fi

source "$CONFIG_FILE"
wallpaper_engine="${wallpaper_engine:-$DEFAULT_ENGINE}"
wallpapers_dir="${wallpaper_dir:-$WALLPAPERS_DIR}"

CURRENT_WALLPAPER=""

get_current_wallpaper(){
  [[ -f "$CACHE_DIR/current_wallpaper" ]] && CURRENT_WALLPAPER=$(cat "$CACHE_DIR/current_wallpaper")
}

get_next_wallpaper(){

  # Set parameter search
  [[ "$wallpaper_engine" = "swww" ]] \
    && search_parameter='-iname "*.jpg" -o -iname "*.png" -o -iname "*.gif"' \
    || search_parameter='-iname "*.jpg" -o -iname "*.png"'

  # Read wallpapers directory
  wallpapers=()
  while IFS= read -r -d $'\0' file; do
    wallpapers+=("$file")
  done < <(find "$wallpapers_dir" -type f \( $search_parameter \) -print0 | sort -z)

  # Check current wallpaper index
  current_index=-1
  for i in "${!wallpapers[@]}"; do
    if [[ "${wallpapers[i]}" = "$current_wallpaper" ]]; then
      current_index=$i
      break
    fi
  done

  #---------------------------------------------------------....
  if [[ ${#wallpapers[@]} -gt 1 ]]; then
    next_index=$(( (current_index + 1) % ${#wallpapers[@]} ))
    next_wallpaper="${wallpapers[$next_index]}"
  else
    next_wallpaper=$(find "$WALLPAPERS_DIR" -type f \( $search_parameter \) | shuf -n 1)
  fi
}

######----------------------------------------......

if [[ "$wallpaper_engine" = "swww" ]]; then
    # swww
    echo ":: Using swww"
    transition_position="${transition_pos:-$(hyprctl cursorpos)}"
    # swww init
    swww-daemon --format xrgb
    sleep 0.5
    swww img $wallpaper --transition-type=$transition_type \
      --transition-duration=$transition_duration \
      --transition-pos="$transition_position"

elif [[ "$wallpaper_engine" = "hyprpaper" ]]; then
    # hyprpaper
    echo ":: Using hyprpaper"
    sleep 0.5
    ~/.config/hypr/scripts/SwitchWallpaper.sh $wallpaper
fi
