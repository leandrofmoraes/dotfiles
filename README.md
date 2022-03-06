## My Dotfiles!

### Summary
<p>This repository contains a collection of configuration files that I currently use.
It was customized and designed with the idea of creating a minimalistic development environment with Arch and Bspwm but it can be easily adapted to any linux distro as long as it installs the required dependencies.</p>
##### 

### Contents
|-|-|
|!<p align="center">
1. <a href="https://github.com/leandrofmoraes/dotfiles#features" target="_blank">Features</a>
2. <a href="https://github.com/leandrofmoraes/dotfiles#dependencies" target="_blank">Dependencies</a>
3. <a href="https://github.com/leandrofmoraes/dotfiles#how-to-install-" target="_blank">Installation</a>
4. <a href="https://github.com/leandrofmoraes/dotfiles#more-screenshots" target="_blank">Screenshots</a>
5. <a href="https://github.com/leandrofmoraes/dotfiles#notes" target="_blank">Notes</a>
</p>|!<p align="center">
	<img src="https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_05.png">
</p>|

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
- Shell: Zsh

### How to Install ?
- Install dependencies according to your Linux distribution. As said, I took Arch as a base, but you can consult the documentation of your favorite distribution and adapt it according to your needs.

```
$ yay -Sy rofi playerctl mpc ffmpeg xclip bluez bluez-utils blueberry alacritty alsa pulseaudio pulsemixer feh redshift mpd ncmpcpp bspwm pqiv ranger ueberzug picom dunst polybar
```
- Install LunarVim following the steps can be seen in its <a href=https://github.com/LunarVim/LunarVim target="_blank">official repository</a>.
- clone this repository to the current user's home directory or /tmp.
```
$ git clone "..." /tmp && cd "/tmp/repo/dotfiles"
```
- copy or move their contents to their respective directories.
```
$ cp -r . $HOME
```
###### Note: in the future I intend to create a script to facilitate this process.

### More Screenshots
<details>
<summary></summary>

|-|-|
|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_01.png)|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_02.png)|

|On fresh boot| With no windows open |
|-|-|
|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_04.png)|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_06.png)|
|-|
|![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/Screenshots/Screenshot_03.png)|

#### Notes
