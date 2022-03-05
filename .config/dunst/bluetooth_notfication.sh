#!/bin/bash

# Bluetooth
# bt_status=$(bluetoothctl info | grep "Connected" | cut -d ":" -f2)
bt_status=$(bluetoothctl info | grep "Connected" | awk -F' ' '{ print $2 }')
icon=$(bluetoothctl info | grep "Icon" | cut -d ":" -f2)

if [[ $bt_status == yes ]]; then
    device_name=$(bluetoothctl info | grep "Alias" | awk -F: '{ print $2 }')
    dunstify -u low -t 2500 -i $icon "Conectado: $device_name"
else
    dunstify -u low -t 2500 -i network-bluetooth "Desconectado"
fi
