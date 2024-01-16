## My Dotfiles!

### About
<p>This repository contains a collection of configuration files that I currently use.
It was customized and designed with the idea of creating a minimalistic development environment with Arch and Bspwm but it can be easily adapted to any linux distro as long as it installs the required dependencies.</p>

<p align="center">
<img src="https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/assets/Screenshot_15.png" align="right" width="400px">
</p>

### Contents
1. <a href="https://github.com/leandrofmoraes/dotfiles#features" target="_blank">Features</a>
2. <a href="https://github.com/leandrofmoraes/dotfiles#changelogs" target="_blank">Changelogs</a>
3. <a href="https://github.com/leandrofmoraes/dotfiles#dependencies" target="_blank">Dependencies</a>
4. <a href="https://github.com/leandrofmoraes/dotfiles#how-to-install-" target="_blank">Installation</a>
5. <a href="https://github.com/leandrofmoraes/dotfiles#more-screenshots" target="_blank">Screenshots</a>
6. <a href="https://github.com/leandrofmoraes/dotfiles#notes" target="_blank">Notes</a>
</p>

### Features.
- Modern look with transparency effects
- Polybar with informative and interactive modules
- Verbose system of notifications using dunst. (battery, music, bluetooth, volume, brightness, calendar)
- Lightweight system can consume on average 430MB of RAM or less after boot. (Depends on the distro used as a base)
- Improved productivity with VI keyboard shortcuts and less frequent mouse use.

### Changelogs
- Settings using picom to provide rounded corners and blur effect.
- Added support for multiple screens in bspwm configuration file
#####

### Dependencies.
- WM: [Bspwm](https://github.com/baskerville/bspwm.git)
- Hotkey daemon: [sxhkd](https://github.com/baskerville/sxhkd)
- Terminal: [Alacritty](https://github.com/alacritty/alacritty)
- Terminal: [kitty](https://github.com/kovidgoyal/kitty.git)
- Notification daemon: [dunst](https://github.com/dunst-project/dunst)
- IDE: [neovim](https://github.com/neovim/neovim)
- IDE: (optional but recommended) [lunarvim](https://github.com/LunarVim/LunarVim)
- Launcher:	[rofi](https://github.com/davatorium/rofi.git)
- UI for git: [LazyGit](https://github.com/jesseduffield/lazygit)
- Monitor of resources: [btop](https://github.com/aristocratos/btop) or [bashtop](https://github.com/aristocratos/bashtop)
- bar: [polybar](https://github.com/polybar/polybar)
- Compositor: [picom (ftlabs fork)](https://github.com/FT-Labs/picom)
- Audio: [pulseaudio](https://gitlab.freedesktop.org/pulseaudio/pulseaudio)
- Player Control: [playerctl](https://github.com/altdesktop/playerctl)
- Music: [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp.git)
- Music: (ncmpcpp dependency): [mpd](https://github.com/MusicPlayerDaemon/MPD)
- Music: (mpd dependency): [mpc](https://github.com/MusicPlayerDaemon/mpc)
- Music: (optional): [mocp](https://github.com/jonsafari/mocp)
- Visualizer: [Cava](https://github.com/karlstav/cava.git)
- File manager: [ranger](https://github.com/ranger/ranger)
- File manager (optional): [Thunar](https://wiki.archlinux.org/title/thunar)
- Images: (ranger dependency): [ueberzug](https://github.com/seebye/ueberzug)
- Images: [pqiv](https://github.com/seebye/ueberzug)
- Images (optional): [sxiv](https://github.com/muennich/sxiv)
- Images: (To set backgrounds) [feh](https://github.com/derf/feh)
- bluetooth: [bluez-utils](https://archlinux.org/packages/extra/x86_64/bluez-utils)
- Night Light: (optional): [redshift](https://github.com/jonls/redshift)
- Lock screen: [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen)
- Shell: Zsh

### How to Install ?
- Install dependencies according to your Linux distribution. As said, I took Arch as a base, but you can consult the documentation of your favorite distribution and adapt it according to your needs.

```
$ yay -Sy bspwm sxhkd polybar alacritty rofi picom dunst playerctl mpc ffmpeg bluez bluez-utils blueberry alsa pulseaudio pulsemixer feh mpd ncmpcpp pqiv ranger ueberzug
```
- Install LunarVim following the steps can be seen in its <a href=https://github.com/LunarVim/LunarVim target="_blank">official repository</a>.
- clone this repository to the current user's home directory or /tmp.
```
$ git clone https://github.com/leandrofmoraes/dotfiles.git /tmp && cd /tmp/dotfiles
```
- copy or move their contents to their respective directories.
```
$ cp -r . $HOME
```
###### Note: in the future I intend to create a script to facilitate this process.

### More Screenshots
<details>
<summary>click</summary>

| Btop, Calendar Notification, Rofi Search Menu and Ranger File Manager |
|-|
|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/assets/Screenshot_14.png)|

| NCMPCPP, Termux and music notification |
|-|
|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/assets/Screenshot_11.png)|

| NeoVim, Tmux and cava | btop, Neovi and Ranger |
|-|-|
|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/assets/Screenshot_12.png)|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/assets/Screenshot_10.png)|

| Polybar with rounded corners and LunarVim with Lunar color scheme | Visual Studio Code with Winter is Coming theme |
|-|-|
|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/assets/Screenshot_08.png)|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/assets/Screenshot_09.png)|

</details>

#### Notes
Some scripts were used as the basis for rofi bluetooth menu and rofi wifi and deserve credit.
- Rofi Wifi: [Rofi-Scripts](https://github.com/niraj998/Rofi-Scripts/tree/main/rofi/wifi)
- Bluetooth menu: [rofi-bluetooth](https://github.com/nickclyde/rofi-bluetooth)
