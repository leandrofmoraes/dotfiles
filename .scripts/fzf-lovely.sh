#!/usr/bin/env bash

# Se $EDITOR não existir, define "vi" como padrão
# DEFAULT_EDITOR="$(echo $EDITOR | awk -F'/' '{print $NF}')"
DEFAULT_EDITOR="${EDITOR:-vi}"
DEFAULT_EDITOR="${DEFAULT_EDITOR##*/}"

function fzf-lovely() {
    # Variáveis locais para controlar as opções
    local open_in_editor=false  # Flag que indica se devemos abrir o arquivo no editor
    local editor=""             # Variável para armazenar o editor a ser usado
    local preview_flag=""       # Opção para definir a visualização do fzf

    # Processamento dos argumentos passados ao script/função
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -e|--editor)
                # Se o editor for especificado com -e ou --editor e houver um valor logo após que não seja outra flag
                if [[ -n "$2" && "$2" != -* ]]; then
                    editor="$2"         # Usa o editor especificado
                    open_in_editor=true   # Ativa a flag para abrir no editor
                    shift 2             # Remove a flag e o valor da lista de argumentos
                else
                    # Se nenhum valor for passado, utiliza o editor definido na variável de ambiente $EDITOR
                    open_in_editor=true
                    editor=$DEFAULT_EDITOR
                    shift 1             # Remove somente a flag
                fi
                ;;
            -v|--vim)
                # Atalho para usar o vim explicitamente
                open_in_editor=true
                editor="vim"
                shift
                ;;
            -h|--horizontal)
                # Define a flag de preview horizontal
                preview_flag="h"
                shift
                ;;
            *)
                # Ignora argumentos desconhecidos
                shift
                ;;
        esac
    done

    # Se a flag de abertura no editor estiver ativa mas nenhum editor foi definido, utiliza $EDITOR (ou vim como fallback)
    if $open_in_editor && [[ -z "$editor" ]]; then
        editor=$DEFAULT_EDITOR
    fi

    # Construção das opções do fzf para o preview da captura
    local fzf_options=""
    if [[ "$preview_flag" == "h" ]]; then
        # Preview com layout reverso e janela de preview maior
        fzf_options="-m --reverse --preview-window down:20 --preview '[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'"
    else
        # Preview padrão
        fzf_options="-m --reverse --preview '[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'"
    fi

    # Executa o fzf com as opções definidas e armazena a seleção
    local selection
    selection=$(eval "fzf $fzf_options")

    # Se houver uma seleção, então:
    if [[ -n "$selection" ]]; then
        if $open_in_editor; then
            # Abre o arquivo selecionado usando o editor definido (usando o caminho completo)
            "$editor" "$selection"
        else
            # Apenas imprime a seleção
            echo "$selection"
        fi
    fi
}
fzf-lovely "$@"

