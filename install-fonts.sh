#!/bin/bash
# Font installation script for Debian 13

set -e

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

echo "=== Installing Nerd Fonts ==="

# Iosevka Nerd Font (used in: waybar, swaylock, fuzzel, alacritty)
echo "Downloading Iosevka Nerd Font..."
curl -fLo /tmp/Iosevka.tar.xz https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz
mkdir -p "$FONT_DIR/Iosevka"
tar -xf /tmp/Iosevka.tar.xz -C "$FONT_DIR/Iosevka"


# Ubuntu Nerd Font (used in swaync)
echo "Downloading Ubuntu Nerd Font..."
curl -fLo /tmp/Ubuntu.tar.xz https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Ubuntu.tar.xz
mkdir -p "$FONT_DIR/Ubuntu"
tar -xf /tmp/Ubuntu.tar.xz -C "$FONT_DIR/Ubuntu"

# Font Awesome (icons in waybar)
echo "Installing Font Awesome..."
sudo apt install -y fonts-font-awesome

echo "=== Refreshing font cache ==="
fc-cache -fv

echo "=== Cleaning up ==="
rm -f /tmp/Iosevka.tar.xz /tmp/Ubuntu.tar.xz

echo ""
echo "=== Installed fonts ==="
echo "• Iosevka Nerd Font"
echo "• Ubuntu Nerd Font"
echo "• Font Awesome"
echo ""
echo "✅ Done! Log out and back in for fonts to be available everywhere."
