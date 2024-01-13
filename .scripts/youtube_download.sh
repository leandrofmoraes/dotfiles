#!/usr/bin/env bash

downloadPath="$HOME/Vídeos"
res=''
format=''

echo '======================='
echo '|  Youtube Downloader |'
echo -e "=======================\n"

formato() {
  echo "1 - mp4"
  echo -e "2 - mkv\n"
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
    *)
      echo "formato invalido!"
      return 1
      ;;
  esac
}

resolucao() {
  echo '1 - 720p'
  echo -e "2 - 1080p\n"
  echo -n 'Escolha a resoluçāo do vídeo: '

  read -r opt
  echo ''

  case "$opt" in
    1)
      res='140+247'
      ;;
    2)
      res='140+248'
      ;;
    *)
      echo "opção invalida!"
      return 1
      ;;
  esac
}

formato
resolucao

echo -n "digite ou cole a url: "
read -r url

yt-dlp -f $res --merge-output-format $format --path $downloadPath $url
