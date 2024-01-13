#!/bin/bash

# source "~/.cache/wal/colors.sh"
# icons="~/.config/polybar/scripts/Important/icons"
# scripts="~/.config/polybar/scripts"
#charging = 3, high = 2, mid = 1,  low = 0

# Set necessary info
# fg="$color15"
# lstate=`cat /tmp/batstate`
ACPI_RES=$(acpi -b)
BAT_LEVEL_ALL=$(echo "$ACPI_RES" | grep -v "unavailable" | grep -E -o "[0-9][0-9]?[0-9]?%")
BAT_LEVEL=$(echo "$BAT_LEVEL_ALL" | awk -F"%" 'BEGIN{tot=0;i=0} {i++; tot+=$1} END{printf("%d%%\n", tot/i)}')
BAT_LEVEL=`printf ${BAT_LEVEL%?}`
Discharging=$(echo "$ACPI_RES" | grep -w 0: | grep -c Discharging)

[[ $BAT_LEVEL -ne 100 ]] && BAT_LEVEL=" $BAT_LEVEL"

# Select an icon
if [[ $BAT_LEVEL -ge 90 ]] 
    then
        # icon=
        icon=
        [[ $Discharging -eq 1 ]]
    elif [[ $BAT_LEVEL -ge 80 ]]
    then
        # icon=
        icon=
        [[ $Discharging -eq 1 ]]
    elif [[ $BAT_LEVEL -ge 70 ]]    
    then    
        # icon=
        icon=
        [[ $Discharging -eq 1 ]]
    elif [[ $BAT_LEVEL -ge 60 ]]    
    then    
        # icon=
        icon=
        [[ $Discharging -eq 1 ]]
    elif [[ $BAT_LEVEL -ge 50 ]] 
    then
        # icon=
        icon=
        [[ $Discharging -eq 1 ]]
    elif [[ $BAT_LEVEL -ge 40 ]]    
    then    
        # icon=
        icon=
        [[ $Discharging -eq 1 ]]
    elif [[ $BAT_LEVEL -ge 30 ]]    
    then    
        # icon=
        icon=
        [[ $Discharging -eq 1 ]]
    elif [[ $BAT_LEVEL -ge 20 ]]    
    then    
        # icon=
        icon=
        [[ $Discharging -eq 1 ]]
    elif [[ $BAT_LEVEL -ge 10 ]]    
    then    
        # icon=
        icon=
        [[ $Discharging -eq 1 ]]
    elif [[ $BAT_LEVEL -gt 5 ]]
    then 
       fg="#FFC139"
       # icon=
       icon=
       [[ $Discharging -eq 1 ]] 
    else
       fg="#FF3939"
       # icon=
       icon=
       [[ $Discharging -eq 1 ]]
fi;
    
# [[ $Discharging -eq 0 ]] && icon=
[[ $Discharging -eq 0 ]] && icon=

# [[ $Discharging -eq 1 ]] && echo "%{F$fg}$BAT_LEVEL% $icon%{F-}"  || ( echo "%{F$fg}$BAT_LEVEL% $icon" )

[[ $Discharging -eq 1 ]] && echo "%{F$fg}$BAT_LEVEL% $icon%{F-}"  || ( echo "%{F$fg}$icon" )




