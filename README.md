# Dotfiles

My personal dotfiles for a Sway-based Wayland desktop on Debian 13 (Trixie).

## Overview
| Component | Program |
|-----------|---------|
| OS | Debian |
| Window Manager | Sway |
| Status Bar | Waybar |
| Terminal | Alacritty |
| Shell | Zsh + Oh-My-Zsh |
| Launcher | Fuzzel |
| Notifications | SwayNC |
| Lock Screen | Swaylock |
| Idle Daemon | Swayidle |
| Logout Menu | Wlogout |
| File Manager | Thunar |
| Browser | Librewolf |
| Editor | Neovim |

## Installation
### 1. Install dependencies
```bash
# Core Sway/Wayland packages
sudo apt install -y --no-install-recommends \
    sway \
    waybar \
    swayidle \
    swaylock \
    sway-notification-center \
    wlogout \
    wl-clipboard \
    xdg-desktop-portal-wlr \
    grim \
    slurp \
    swaybg

# Launcher
sudo apt install -y fuzzel

# Terminal and tools
sudo apt install -y --no-install-recommends \
    alacritty \
    thunar \
    brightnessctl \
    pavucontrol \
    blueman
```

### 2. Install fonts
Use the `install-fonts.sh` script

### 3. Clone and stow dotfiles

```bash
git clone https://github.com/katikistan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow sway waybar alacritty fuzzel swaync swaylock swayidle
```

Or manually copy:

```bash
cp -r sway/.config/sway ~/.config/
cp -r waybar/.config/waybar ~/.config/
cp -r alacritty/.config/alacritty ~/.config/
cp -r fuzzel/.config/fuzzel ~/.config/
cp -r swaync/.config/swaync ~/.config/
cp -r swaylock/.config/swaylock ~/.config/
cp -r swayidle/.config/swayidle ~/.config/
```

