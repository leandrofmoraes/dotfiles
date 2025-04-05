#!/usr/bin/env bash

downloadPath="$HOME/Downloads"
ytdlp="$HOME/apps/yt-dlp"

echo '======================='
echo '|  Youtube Downloader |'
echo -e "=======================\n"

formato() {
	echo "1 - mp4"
	echo "2 - mkv"
	echo -e "3 - mp3\n"
	echo -n 'Escolha um formato: '

	read -r opt
	echo ''

	case "$opt" in
	1)
		format='mp4'
		;;
	2)
		format='mkv'
		;;
    3)
        format='mp3'
        ;;
	*)
		echo "formato invalido!"
		return 1
		;;
	esac
}

resolution() {
	echo -e "\n1 - 480p"
	echo -e "2 - 720p"
	echo -e "3 - 1080p"
	echo -e "4 - 1440p\n"
	echo -n 'Escolha a resoluçāo do vídeo: '

	read -r opt
	echo ''

	case "$opt" in
	1)
		res='140+243'
        ;;
	2)
		res='140+247'
        altRes='140+136'
		;;
	3)
		res='140+248'
        altRes='140+137'
		;;
	4)
		res='140+308'
		;;
	*)
		echo "opção invalida!"
		return 1
		;;
	esac
}

formato

echo -n "digite ou cole a url: "
read -r url

if [[ $format == "mp3" ]]; then
  downloadPath="$HOME/Música"
  "$ytdlp" --format bestaudio --extract-audio --audio-format "$format" --audio-quality 320K --path "$downloadPath" "$url"
else
  downloadPath="$HOME/Vídeos"
  resolution
  "$ytdlp" -f "$res" --merge-output-format "$format" --path "$downloadPath" "$url" ||
  "$ytdlp" -f "$altRes" --merge-output-format "$format" --path "$downloadPath" "$url"
fi

