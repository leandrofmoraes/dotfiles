#!/bin/bash
# Script para exibir a hora atual como notificação

hora=$(date +"%H:%M")
notify-send -i "clock" "$hora"
