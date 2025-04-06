# My Dotfiles

## About

<p>This repository contains a collection of configuration files that I currently use. It was designed with the idea of ​​creating a minimalist development environment based on Arch Linux with Bspwm and/or Hyprland, but can easily be adapted to any Linux distribution as long as the necessary dependencies are installed.</p>

<p align="center">
  <img src="https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/screenshots/Screenshot_01a.png" alt="Screenshot" width="400px">
</p>

## Contents

1. [Features](#features)
2. [Dependencies](#dependencies)
3. [How to Install](#how-to-install)
4. [More Screenshots](#more-screenshots)

## Features

- Complete configuration for two popular window managers: BSPWM and Hyprland
- Dynamic auto-tiling of windows
- Optimized for low RAM usage
- Modern look with transparency, rounded corners, and transition effects
- Notification daemon for enhanced alerts
- Improved productivity with extensive keyboard shortcuts and minimal mouse reliance

## Dependencies

<details open>
<summary><b>Dependencies for BSPWM</b></summary>

- **WM:** [Bspwm](https://github.com/baskerville/bspwm.git)
- **Hotkey daemon:** [sxhkd](https://github.com/baskerville/sxhkd)
- **Bar:** [polybar](https://github.com/polybar/polybar)
- **Compositor:** [picom (FT Labs fork)](https://github.com/FT-Labs/picom)
- **Wallpapers:** [feh](https://github.com/derf/feh)
- **Night Light (optional):** [redshift](https://github.com/jonls/redshift)
- **Lock screen:** [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen)
- **Notification daemon:** [dunst](https://github.com/dunst-project/dunst)
</details>

<details open>
<summary><b>Dependencies for Hyprland</b></summary>

- **WM:** [Hyprland](https://hyprland.org)
- **Bar:** [Waybar](https://github.com/Alexays/Waybar)
- **Lock screen:** [Hyprlock](https://github.com/hyprwm/hyprlock)
- **Notification daemon:** [swaync](https://github.com/ErikReider/SwayNotificationCenter)
- **Wallpapers:** [hyprpaper](https://github.com/hyprwm/hyprpaper)
- **Idle daemon:** [Hypridle](https://github.com/hyprwm/hypridle)
- **Screenshots:**
  - [grim](https://github.com/emersion/grim) (Capture images from a Wayland compositor)
  - [slurp](https://github.com/emersion/slurp) (Select a region)
  - [swappy](https://github.com/jtheoof/swappy) (Snapshot editor tool)
  </details>

<details>
<summary><b>Other Programs</b></summary>

- **Package manager:** [yay](https://github.com/Jguer/yay)
- **Terminals:** [Alacritty](https://github.com/alacritty/alacritty) and [Kitty](https://github.com/kovidgoyal/kitty.git)
- **IDE:** [Neovim](https://github.com/neovim/neovim)
- **Application launcher:** [rofi-wayland (A Rofi fork)](https://github.com/in0ni/rofi-wayland)
- **UI for Git:** [LazyGit](https://github.com/jesseduffield/lazygit)
- **Resource monitors:** [btop](https://github.com/aristocratos/btop) or [bashtop](https://github.com/aristocratos/bashtop)
- **Audio:** [pulseaudio](https://gitlab.freedesktop.org/pulseaudio/pulseaudio) and [pulseaudio-ctl](https://github.com/graysky2/pulseaudio-ctl)
- **Player Control:** [playerctl](https://github.com/altdesktop/playerctl)
- **Music players:** [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp.git), [mpd](https://github.com/MusicPlayerDaemon/MPD), [mpc](https://github.com/MusicPlayerDaemon/mpc), _(optional)_ [mocp](https://github.com/jonsafari/mocp), _(optional)_ [kew](https://github.com/ravachol/kew)
- **Video player:** [mpv](https://mpv.io/) + [mpvconfig](https://github.com/zydezu/mpvconfig)
- **Visualizer:** [Cava](https://github.com/karlstav/cava.git)
- **File managers:** _(optional)_ [Thunar](https://wiki.archlinux.org/title/thunar) and [yazi](https://github.com/sxyazi/yazi)
- **System fetch:** [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- **PDF reader:** [zathura](https://github.com/pwmt/zathura)
- **Bonus utilities:**
  - [bat](https://github.com/sharkdp/bat) – a cat clone with syntax highlighting
  - [micro](https://github.com/zyedidia/micro) – a modern text editor
- **Bluetooth:** [bluez](https://www.bluez.org/) + [bluez-utils](https://archlinux.org/packages/extra/x86_64/bluez-utils)
- **Images (ranger dependency):** [ueberzugpp](https://github.com/jstkdng/ueberzugpp), [pqiv](https://github.com/seebye/ueberzug), _(optional)_ [sxiv](https://github.com/muennich/sxiv)
</details>

```bash
yay -S ranger python-pynvim ueberzugpp
```

### How to Install ?

- Step 1: Install the dependencies according to your Linux distribution. Although this setup is based on Arch Linux, you can consult your preferred distribution's documentation and adapt as necessary.

```bash
$ yay -Sy bspwm sxhkd polybar alacritty rofi picom dunst playerctl mpc ffmpeg bluez bluez-utils blueberry alsa pulseaudio pulsemixer feh mpd ncmpcpp pqiv ranger ueberzug
```

- Step 2: Clone this repository to your home directory or a temporary folder.

```bash
$ git clone https://github.com/leandrofmoraes/dotfiles.git /tmp && cd /tmp/dotfiles
```

- Step 4: Copy or move the contents to their respective directories.

```bash
$ cp -r . $HOME
```

### More Screenshots

<details>
<summary>click</summary>

| Kew and Swaync on Hyprland                                                                           |
| ---------------------------------------------------------------------------------------------------- |
| ![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/screenshots/Screenshot_04.png) |

| NCMPCPP, Tmux and music notification on BSPWM                                                         | NeoVim, Cmatrix, Tmux and cava on BSPWM                                                               |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| ![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/screenshots/Screenshot_11b.png) | ![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/screenshots/Screenshot_12b.png) |

| Cava, Kitty and Neovim on Hyprland                                                                   | Neovim and Kew on Hyprland                                                                           |
| ---------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| ![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/screenshots/Screenshot_16.png) | ![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/screenshots/Screenshot_17.png) |

| MPV, Cava, Rofi-wayland and Swaync on Hyprland                                                       | Btop, Fzf, LazyGit and Cmatrix on Hyprland                                                           |
| ---------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| ![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/screenshots/Screenshot_14.png) | ![img](https://github.com/leandrofmoraes/dotfiles/blob/master/Imagens/screenshots/Screenshot_09.png) |

</details>
