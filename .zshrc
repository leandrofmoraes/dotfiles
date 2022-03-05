# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
  
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

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

source /home/leandro/.my_aliases
source /home/leandro/.my_functions
PATH=$PATH:/usr/sbin:/sbin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
