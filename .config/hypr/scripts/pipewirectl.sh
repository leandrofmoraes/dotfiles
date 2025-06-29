#!/bin/bash

# pipewire-ctl.sh
# Controle de Volume e Microfone para PipeWire com notificações aprimoradas.

# --- Configurações ---
NOTIFY_ID=9993 # ID de substituição para notificações (evita acumulação)
ICON_SIZE=12   # Tamanho do ícone em pixels (ajuste conforme sua preferência)

# --- Funções Auxiliares ---

# Função para enviar notificações de volume com barra de progresso
# $1: Ícone (e.g., audio-volume-high, audio-volume-medium, audio-volume-low, audio-volume-muted)
# $2: Nível de volume (0-100)
send_volume_notification() {
    local icon="$1"
    local volume_level="$2"

    notify-send \
        -a "pipewire-ctl" \
        -u low \
        -r "$NOTIFY_ID" \
        --hint=int:value:"$volume_level" \
        --hint=int:transient:1 \
        --hint=string:synchronous:volume \
        --hint=int:image-size:"$ICON_SIZE" \
        -i "$icon"  \
        "Volume: ${volume_level}%" \
        -t 1000 # Tempo em milissegundos para a notificação
}

# Função para enviar notificação de mudo
# $1: 'yes' ou 'no' (estado de mudo)
# $2: 'sink' para alto-falantes, 'source' para microfone
send_mute_notification() {
    local is_muted="$1"
    local type="$2"
    local icon=""
    local message=""

    if [[ "$type" == "sink" ]]; then
        if [[ "$is_muted" == "yes" ]]; then
            message="Muted"
            icon="audio-volume-muted"
        else
            message="Unmuted"
            icon="audio-volume-high" # Ícone padrão para desmutado
        fi
    elif [[ "$type" == "source" ]]; then
        if [[ "$is_muted" == "yes" ]]; then
            message="Mic Muted"
            icon="microphone-sensitivity-muted" # Ícone de microfone mutado
        else
            message="Mic Unmuted"
            icon="microphone-sensitivity-high" # Ícone de microfone normal
        fi
    fi

    notify-send \
        -a "pipewire-ctl" \
        -u low \
        -r "$NOTIFY_ID" \
        --hint=int:transient:1 \
        --hint=int:image-size:"$ICON_SIZE" \
        -i "$icon" \
        "$message" \
        -t 1000
}

# Função para obter o volume atual de um dispositivo
# $1: '@DEFAULT_SINK@' para alto-falantes, '@DEFAULT_SOURCE@' para microfone
get_current_volume() {
    wpctl get-volume "$1" | awk '{print int($2 * 100)}'
}

# Função para obter o estado de mudo de um dispositivo
# $1: '@DEFAULT_SINK@' para alto-falantes, '@DEFAULT_SOURCE@' para microfone
get_mute_status() {
    if wpctl get-volume "$1" | grep -q "MUTED"; then
        echo "yes"
    else
        echo "no"
    fi
}

# Função para desmutar um dispositivo
# $1: '@DEFAULT_SINK@' para alto-falantes, '@DEFAULT_SOURCE@' para microfone
unmute_device() {
    wpctl set-mute "$1" 0 # 0 significa desmutar
}

set_icon() {
    # Define o ícone com base no volume atual
    CURRENT_VOLUME=$(get_current_volume @DEFAULT_SINK@)

    if [[ "$CURRENT_VOLUME" -ge 70 ]]; then
        ICON="audio-volume-high"
    elif [[ "$CURRENT_VOLUME" -ge 30 ]]; then
        ICON="audio-volume-medium"
    else
        ICON="audio-volume-low"
    fi
}
# --- Lógica Principal ---
case "$1" in
    set)
        # Verifica se o sink está mutado, e desmuta antes de definir o volume
        if [[ "$(get_mute_status @DEFAULT_SINK@)" == "yes" ]]; then
            unmute_device @DEFAULT_SINK@
            send_mute_notification "no" "sink" # Envia notificação de desmutado
        fi

        if [[ -z "$2" ]]; then
            echo "Uso: $0 set <volume>"
            exit 1
        fi

        wpctl set-volume @DEFAULT_SINK@ "$2%"
        CURRENT_VOLUME=$(get_current_volume @DEFAULT_SINK@)
        set_icon
        send_volume_notification "$ICON" "$CURRENT_VOLUME"

    ;;
    up)
        # Verifica se o sink está mutado, e desmuta antes de aumentar o volume
        if [[ "$(get_mute_status @DEFAULT_SINK@)" == "yes" ]]; then
            unmute_device @DEFAULT_SINK@
            send_mute_notification "no" "sink" # Envia notificação de desmutado
        fi

        wpctl set-volume @DEFAULT_SINK@ 5%+

        set_icon
        send_volume_notification "$ICON" "$CURRENT_VOLUME"
        ;;

    down)
        wpctl set-volume @DEFAULT_SINK@ 5%-

        set_icon
        send_volume_notification "$ICON" "$CURRENT_VOLUME"
        ;;

    mute)
        wpctl set-mute @DEFAULT_SINK@ toggle
        MUTE_STATUS=$(get_mute_status @DEFAULT_SINK@)
        send_mute_notification "$MUTE_STATUS" "sink"
        ;;

    mic-up)
        # Não desmutamos microfone automaticamente ao aumentar, pois o usuário pode ter um motivo para mantê-lo mutado.
        wpctl set-volume @DEFAULT_SOURCE@ 5%+
        CURRENT_MIC_VOLUME=$(get_current_volume @DEFAULT_SOURCE@)
        notify-send \
            -a "pipewire-ctl" \
            -u low \
            -r "$NOTIFY_ID" \
            --hint=int:value:"$CURRENT_MIC_VOLUME" \
            --hint=int:transient:1 \
            --hint=string:synchronous:microphone-volume \
            --hint=int:image-size:"$ICON_SIZE" \
            -i "microphone-sensitivity-high" \
            "Microphone: ${CURRENT_MIC_VOLUME}%" \
            -t 1000
        ;;

    mic-down)
        wpctl set-volume @DEFAULT_SOURCE@ 5%-
        CURRENT_MIC_VOLUME=$(get_current_volume @DEFAULT_SOURCE@)
        notify-send \
            -a "pipewire-ctl" \
            -u low \
            -r "$NOTIFY_ID" \
            --hint=int:value:"$CURRENT_MIC_VOLUME" \
            --hint=int:transient:1 \
            --hint=string:synchronous:microphone-volume \
            --hint=int:image-size:"$ICON_SIZE" \
            -i "microphone-sensitivity-medium" \
            "Microphone: ${CURRENT_MIC_VOLUME}%" \
            -t 1000
        ;;

    mic-mute)
        wpctl set-mute @DEFAULT_SOURCE@ toggle
        MUTE_STATUS=$(get_mute_status @DEFAULT_SOURCE@)
        send_mute_notification "$MUTE_STATUS" "source"
        ;;

    *)
        echo "Uso: $0 {up|down|mute|mic-up|mic-down|mic-mute}"
        exit 1
        ;;
esac

exit 0
