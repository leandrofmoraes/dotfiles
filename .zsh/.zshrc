# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/Documentos/.token
#set lunarvim as default editor
VISUAL=/home/leandro-f/.local/bin/lvim
export EDITOR="$VISUAL"
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin
export PATH=$PATH:$HOME/.emacs.d/bin
export GITHUB_TOKEN=$TOKEN


if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace                                          # Don't save commands that start with space

HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=50000

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

source $HOME/.zkeybingings
source $HOME/.my_aliases
source $HOME/.my_functions
PATH=$PATH:/usr/sbin:/sbin

#Plugins
source /usr/share/zsh/plugins/cp/cp.plugin.zsh
source /usr/share/zsh/plugins/fzf/fzf.plugin.zsh
# source /usr/share/zsh/plugins/zsh-colorls/zsh-colorls.plugin.zsh
source /usr/share/zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh
# source /usr/share/zsh/plugins/zsh-extend-history/extend-history.plugin.zsh
# source /usr/share/zsh/plugins/auto-color-ls/auto-color-ls.plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
