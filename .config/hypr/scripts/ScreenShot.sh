#!/usr/bin/env bash

# Original script by:
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
#
# Forked and modified by:
# https://github.com/leandrofmoraes


# Screenshots scripts

iDIR="$HOME/.config/swaync/icons"

time=$(date "+%d-%b_%H-%M-%S")
dir="$(xdg-user-dir)/Imagens/Screenshots_off"
file="Screenshot_${time}_${RANDOM}.png"

active_window_class=$(hyprctl -j activewindow | jq -r '(.class)')
active_window_file="Screenshot_${time}_${active_window_class}.png"
active_window_path="${dir}/${active_window_file}"

# notify and view screenshot
notify_view() {
    msg=""
    icon=""

    case "$1" in
        "active")
            if [[ -e "${active_window_path}" ]]; then
                msg="Screenshot of '${active_window_class}' Saved."
                icon="${active_window_path}"

            # "${sDIR}/Sounds.sh" --screenshot
        else
            msg="Screenshot of '${active_window_class}' not Saved"
            # "${sDIR}/Sounds.sh" --error
            fi;;
        "swappy")
            msg="Screenshot Captured." ;;
        *)
            local check_file="$dir/$file"
            if [[ -e "$check_file" ]]; then
                msg="Screenshot Saved."
                icon="$check_file"
                # "${sDIR}/Sounds.sh" --screenshot
            else
                msg="Screenshot NOT Saved."
                # "${sDIR}/Sounds.sh" --error
            fi
    esac

    notify-send -h string:x-canonical-private-synchronous:shot-notify -u low -i "$icon" "$msg"
}

# countdown
countdown() {
    t="$((1000*sec))"
	for sec in $(seq "$1" -1 1); do
        notify-send -h int:value:"$((sec*10))" -h string:x-canonical-private-synchronous:shot-notify -t "$t" -i "$iDIR"/timer.png "Taking shot in : $sec"
		sleep 1
	done
}

# take shots
shotnow() {
	cd "${dir}" && grim - | tee "$file" | wl-copy
	sleep 2
	notify_view
}

# take shots in 5 seconds
shot5() {
	countdown '5'
	sleep 1 && cd "${dir}" && grim - | tee "$file" | wl-copy
	sleep 1
	notify_view

}

#take shots in 10 seconds
shot10() {
	countdown '10'
	sleep 1 && cd "${dir}" && grim - | tee "$file" | wl-copy
	notify_view
}

#take shots of active window
# shotwin() {
# 	w_pos=$(hyprctl activewindow | grep 'at:' | cut -d':' -f2 | tr -d ' ' | tail -n1)
# 	w_size=$(hyprctl activewindow | grep 'size:' | cut -d':' -f2 | tr -d ' ' | tail -n1 | sed s/,/x/g)
# 	cd "${dir}" && grim -g "$w_pos $w_size" - | tee "$file" | wl-copy
# 	notify_view
# }

#take shots of active window
shotactive() {
    active_window_class=$(hyprctl -j activewindow | jq -r '(.class)')
    active_window_file="Screenshot_${time}_${active_window_class}.png"
    active_window_path="${dir}/${active_window_file}"

    hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - "${active_window_path}"
	sleep 1
    wl-copy <"$active_window_path"
    notify_view "active"
}

#take shots of selected area
shotarea() {
	tmpfile=$(mktemp)
	grim -g "$(slurp)" - >"$tmpfile"
	if [[ -s "$tmpfile" ]]; then
		wl-copy <"$tmpfile"
		mv "$tmpfile" "$dir/$file"
	fi
	notify_view
}

# take a screenshot and edit with swappy
shotswappy() {
	tmpfile=$(mktemp)
	# grim -g "$(slurp)" - >"$tmpfile" && "${sDIR}/Sounds.sh" --screenshot && notify_view "swappy"
	grim -g "$(slurp)" - >"$tmpfile" &&  notify_view "swappy"
	swappy -f - <"$tmpfile"
	rm "$tmpfile"
}

if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

manual(){
    echo -e "Available Options :\n
    -n | --now\n
    -V | --in5\n
    -X | --in10\n
    -w | --win\n
    -a | --area\n
    -A | --active\n
    -s | --swappy"
}

case "$1" in
    "-n" | "--now")
        shotnow ;;
    "-V" | "--in5")
        shot5 ;;
    "-X" | "--in10")
        shot10 ;;
    "-w" | "--win")
        # shotwin ;;
        shotactive ;;
    "-a" | "--area")
        shotarea ;;
    "-A" | "--active")
        shotactive ;;
    "-s" |"--swappy")
        shotswappy ;;
    *)
        manual ;;
esac

exit 0
