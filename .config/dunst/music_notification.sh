#!/bin/bash
notifier="dunstify"

notifyState=""
img="gnome-music"

mpddir=/run/media/leandro-f/Arquivos/Musicas

Cover=/tmp/cover.png
# if cover not found in metadata use this instead
bkpCover=~/.config/rofi/music/music.jpg
thumbs=".cache/thumbnails/thumbs"


title() {
title=$(playerctl --player=$Control metadata --format {{title}} | cut -c1-35)
[ -z "$title" ] && title="Play Something"
}

########################## Artist ##########################
artist() {
artist=$(playerctl --player=$Control metadata --format {{artist}} | cut -c1-35)
[ -z "$artist" ] && artist="Artist"
}

########################## Album ##########################
album() {
album=$(playerctl --player=$Control metadata --format {{album}} | cut -c1-35)
[ -z "$album" ] && album="Album"
}

########################## Status ##########################
status() {
status=$(playerctl --player=$Control status)
[ -z "$status" ] && status="Stopped"
}

########################## trackNumber ##########################
playlist() {
playlist=$(playerctl --player=$Control metadata xesam:trackNumber)
[ -z "$playlist" ] && playlist="0"
}

########################## Cover ##########################
cover() {
albumart="$(playerctl --player=$Control metadata mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')"
[ $(playerctl --player=$Control metadata mpris:artUrl) ] && curl -s "$albumart" --output $Cover || cp $bkpCover $Cover 
}

# MPD Scripts

########################## Title ##########################
mpcTitle=$(mpc -f %title% current | cut -c1-35) || mpcTitle="Play Something"

########################## Artist ##########################
mpcArtist=$(mpc -f %artist% current | cut -c1-35) || mpcArtist="Artist"

########################## Album ##########################
mpcAlbum=$(mpc -f %album% current | cut -c1-35) || mpcAlbum="Album" 

########################## Cover ##########################
mpccover() {
    echo $(ffmpeg -i "$mpddir"/"$(mpc current -f %file%)" -vf scale=w=200:h=200 -vsync 2 "${Cover}" -y || cp $bkpCover $Cover)
}

getStatus=$(mpc status | head -n 2 | tail -n1 | cut -d ']' -f1 | sed 's/^\[//')
case $getStatus in
    playing)
        notifyState="契"
        ;;
    paused)
        notifyState=" "
        ;;
esac

# Get the truncated title
setupNotif() {
    mpccover
    # notifyText="$(getTitle | iconv -c -t UTF-8)"
    img=/tmp/cover.png
    progressValue=$(mpc status | head -n 2 | tail -n1 | cut -d '(' -f2 | sed 's/%)$//')
    progress="-h int:value:$progressValue"
}

# notifyBody=$(printf "$mpcArtist\nSong: $mpcTitle\nAlbum: $mpcAlbum")
notifyBody=$(printf "$mpcArtist - $mpcAlbum\n $notifyState $mpcTitle")
# echo "$notifyText" | grep -axv '.*'
setupNotif
notify-send -h string:x-dunst-stack-tag:music "$notifyBody" $progress -i $img -u low -t 3000 --hint=int:transient:1 
