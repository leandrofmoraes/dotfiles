# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p11k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Fixes rendering issues of Java applications in desktop/Wayland environments.
# export _JAVA_AWT_WM_NONREPARENTING=1 # uncomment if necessary

# source $HOME/Documentos/.token
#set neovim as default editor
VISUAL=$HOME/.local/share/bob/nvim-bin/nvim
export EDITOR="$VISUAL"
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin/
export PATH=$PATH:$JAVA_HOME/bin
# export PATH=$PATH:$HOME/.emacs.d/bin
# export GITHUB_TOKEN=$TOKEN
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="p10k"

#
# Ativar completions do Zsh
autoload -Uz compinit
compinit

# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#   source /usr/share/zsh/manjaro-zsh-config
# fi
# # Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace                                          # Don't save commands that start with space

setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt sharehistory
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zhistory

zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
zstyle ':completion:*' menu select                              # Highlight menu selection
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration

# Substitui simbolo do OS na powerline do terminal. Comente as duas linhas padrao simbolo do Manjaro.
# typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=$'\uF303' #Arch OS symbol
typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=$'\uF17C' #Tux OS symbol

## Distro icons
# \uF300 - Arch Linux
# \uF301 - CentOS
# \uF30F - CoreOS
# \uF302 - Debian
# \uF311 - Elementary OS
# \uF303 - Fedora (and inverse icon \uF312)
# \uF30E - FreeBSD
# \uF310 - Gentoo
# \uF304 - Linux Mint (and inverse icon \uF305)
# \uF306 - Mageia
# \uF307 - Mandriva
# \uF308 - OpenSUSE
# \uF309 - Red Hat
# \uF313 - Sabayon
# \uF30A - Slackware
# \uF17C - Tux (or \uE712)
# \uF30C - Ubuntu (and inverse icon \uF30D)
# \uF179 - Apple (or \uE711)
# \uE7B0 - Docker
# \uE722 - Rasberry Pi
# \uf315 - Raspberry Pi
# eval "$(gh copilot alias -- zsh)"

## Plugins section: Enable fish style features
#Plugins

plugins=(
  git
  fzf
  zsh-interactive-cd
  history-substring-search
  colored-man-pages
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source ~/.zsh/plugins/cp/cp.plugin.zsh
# source ~/.zsh/plugins/fzf/fzf.plugin.zsh
# source /usr/share/zsh/plugins/zsh-colorls/zsh-colorls.plugin.zsh
# source ~/.zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh
source ~/.zsh/plugins/zsh-extend-history/extend-history.plugin.zsh
# source /usr/share/zsh/plugins/auto-color-ls/auto-color-ls.plugin.zsh
# source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use history substring search
# source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Use syntax highlighting
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source "$HOME/.zkeybingings"
source "$HOME/.aliases"
source "$HOME/.functions"
source  $ZSH/oh-my-zsh.sh
PATH=$PATH:/usr/sbin:/sbin

# Set 'man' colors
# function man() {
#     env \
#     LESS_TERMCAP_mb=$'\e[01;31m' \
#     LESS_TERMCAP_md=$'\e[01;31m' \
#     LESS_TERMCAP_me=$'\e[0m' \
#     LESS_TERMCAP_se=$'\e[0m' \
#     LESS_TERMCAP_so=$'\e[01;44;33m' \
#     LESS_TERMCAP_ue=$'\e[0m' \
#     LESS_TERMCAP_us=$'\e[01;32m' \
#     man "$@"
# }

## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# split command into array of arguments
local -a cmdargs
cmdargs=("${(z)2}")

# if [[ ! $TERM_PROGRAM =~ tmux ]]; then
#   tmux new-session -s session
# fi

# Finalize Powerlevel10k instant prompt. Should stay at the bottom of ~/.zshrc.
# (( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# Load Angular CLI autocompletion.
source <(ng completion script)
