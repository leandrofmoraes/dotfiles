#!/usr/bin/env bash

USER=$(whoami)
HOSTNAME=$(hostname)
OS=$(grep "^PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)
ARCH=$(uname -m)
UPTIME=$(uptime -p | sed 's/up //')
# CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
# RAM_USAGE=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
# DISK_USAGE=$(df -h / | awk 'NR==2 {print $3 "/" $2}')
# HOME_USAGE=$(du -sh $HOME | awk '{print $1}')
# TEMP_CPU=$(sensors | grep 'Package id 0' | awk '{print $4}')
# BATTERY=$(upower -i $(upower -e | grep 'BAT') | grep "percentage" | awk '{print $2}')
# NET_IFACE=$(ip route get 1.1.1.1 | awk '{print $5}')
# IP_LOCAL=$(ip -4 addr show $NET_IFACE | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
# IP_PUBLIC=$(curl -s ifconfig.me)
# PACKAGES=$(pacman -Q | wc -l)  # Use `dpkg --list | wc -l` on Debian/Ubuntu

case $OS in
    "Arch Linux" | "Arch")
        OS_ICON="\uF303"
        ;;
    "Alpine" | "Alpine Linux")
        OS_ICON="\uF300"
        ;;
    "Android")
        OS_ICON="\uF17B"
        ;;
    "Manjaro Linux")
        OS_ICON="\uF312"
        ;;
    "CentOS Linux")
        OS_ICON="\uF304"
        ;;
    "CoreOS")
        OS_ICON="\uF305"
        ;;
    "Debian GNU/Linux")
        OS_ICON="\uF306"
        ;;
    "elementary OS")
        OS_ICON="\uF309"
        ;;
    "Fedora")
        OS_ICON="\uF30A"
        ;;
    "FreeBSD")
        OS_ICON="\uF30E"
        ;;
    "Gentoo")
        OS_ICON="\uF30D"
        ;;
    "Linux Mint")
        OS_ICON="\uF30E"
        ;;
    "Rapberry Pi OS")
        OS_ICON="\uF315"
        ;;
    "Mandriva")
        OS_ICON="\uF307"
        ;;
    "openSUSE")
        OS_ICON="\uF314"
        ;;
    "Red Hat Enterprise Linux")
        OS_ICON="\uF316"
        ;;
    "Sabayon")
        OS_ICON="\uF313"
        ;;
    "Slackware")
        OS_ICON="\uF319"
        ;;
    "Ubuntu")
        OS_ICON="\uF31B"
        ;;
    *)
        OS_ICON="\uF17C"
        ;;
esac

TOOLTIP=$(echo -ne "$OS_ICON OS: $OS\n Kernel: $KERNEL ($ARCH)\n User: $USER\n󰟀 Host: $HOSTNAME\n󱦟 Uptime: $UPTIME" | jq -R -s '.')

# TEXT=$(echo -ne "$OS_ICON " | jq -R -s '.') # Uncomment this line if you want to display the OS icon dinamically
TEXT=$(echo -ne "\uF303 " | jq -R -s '.') # Uncomment this line if you want to display the Arch Linux icon

# echo -e "{\"text\": \"\", \"tooltip\": \"$TOOLTIP\", \"class\": \"sysinfo\"}"
echo "{\"text\": $TEXT, \"tooltip\": $TOOLTIP, \"class\": \"sysinfo\"}"
