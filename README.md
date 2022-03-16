## My Dotfiles!

### About
<p>This repository contains a collection of configuration files that I currently use.
It was customized and designed with the idea of creating a minimalistic development environment with Arch and Bspwm but it can be easily adapted to any linux distro as long as it installs the required dependencies.</p>

<p align="center">
<img src="https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_05.png" align="right" width="400px">
</p>

### Contents
1. <a href="https://github.com/leandrofmoraes/dotfiles#features" target="_blank">Features</a>
2. <a href="https://github.com/leandrofmoraes/dotfiles#dependencies" target="_blank">Dependencies</a>
3. <a href="https://github.com/leandrofmoraes/dotfiles#how-to-install-" target="_blank">Installation</a>
4. <a href="https://github.com/leandrofmoraes/dotfiles#more-screenshots" target="_blank">Screenshots</a>
5. <a href="https://github.com/leandrofmoraes/dotfiles#notes" target="_blank">Notes</a>
</p> 

### Features.
- Modern look with transparency effects
- Polybar with informative and interactive modules
- Verbose system of notifications using dunst. (battery, music, bluetooth, volume, brightness, calendar)
- Lightweight system can consume on average 430MB of RAM or less after boot. (Depends on the distro used as a base)
- Improved productivity with VI keyboard shortcuts and less frequent mouse use.
#####

### Dependencies.
- WM: [Bspwm](https://github.com/baskerville/bspwm.git)
- Hotkey daemon: [sxhkd](https://github.com/baskerville/sxhkd)
- Terminal: [Alacritty](https://github.com/alacritty/alacritty)
- Terminal (optional): [kitty](https://github.com/kovidgoyal/kitty.git)
- Notification daemon: [dunst](https://github.com/dunst-project/dunst)
- IDE: [neovim](https://github.com/neovim/neovim)
- IDE: (optional but recommended) [lunarvim](https://github.com/LunarVim/LunarVim)
- Launcher:	[rofi](https://github.com/davatorium/rofi.git)
- bar: [polybar](https://github.com/polybar/polybar)
- Compositor: [picom](https://github.com/ibhagwan/picom.git)
- Audio: [pulseaudio](https://gitlab.freedesktop.org/pulseaudio/pulseaudio)
- Player Control: [playerctl](https://github.com/altdesktop/playerctl)
- Music: [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp.git)
- Music: (ncmpcpp dependency): [mpd](https://github.com/MusicPlayerDaemon/MPD)
- Music: (mpd dependency): [mpc](https://github.com/MusicPlayerDaemon/mpc)
- Visualizer: [Cava](https://github.com/karlstav/cava.git)
- File manager: [ranger](https://github.com/ranger/ranger)
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
$ yay -Sy bspwm sxhkd polybar alacritty rofi picom dunst playerctl mpc ffmpeg betterlockscreen bluez bluez-utils blueberry alsa pulseaudio pulsemixer feh redshift mpd ncmpcpp pqiv ranger ueberzug
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

| LunarVim (NeoVim with Lua) | With Ranger and Calendar notification |
|-|-|
|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_01.png)|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_02.png)|

| On fresh boot | With no windows open |
|-|-|
|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_04.png)|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_06.png)|

| NCMPCPP and music notification |
|-|
|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_03.png)|

| Polybar with rounded corners and LunarVim with onedark color scheme |
|-|
|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_08.png)|

</details>

#### Notes
Some scripts were used as the basis for rofi bluetooth menu and rofi wifi and deserve credit.
- Rofi Wifi: [Rofi-Scripts](https://github.com/niraj998/Rofi-Scripts/tree/main/rofi/wifi)
- Bluetooth menu: [rofi-bluetooth](https://github.com/nickclyde/rofi-bluetooth)
