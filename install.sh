#!/bin/bash

sudo usermod -aG sudo katikistan

# Update package list
sudo apt update && sudo apt upgrade -y

# Install essential build tools
sudo apt install -y build-essential cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

# Install curl for downloading files
sudo apt install -y curl

# Install Zsh shell and Oh-My-Zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Alacritty terminal (with dependencies)
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
sudo apt install -y alacritty
# Install Rust programming language
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


# conda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# Install net-tools (for networking tools like ifconfig)
sudo apt install -y net-tools

# Install Nmap for network exploration and security auditing
sudo apt install -y nmap
sudo apt install -y blueman 
# Install netcat (utility for reading and writing network connections)
sudo apt install -y netcat-openbsd

# Install Wireshark (network protocol analyzer)
sudo apt install -y wireshark

# Install htop (interactive process viewer)
sudo apt install -y htop

# Install neofetch (system information tool)
sudo apt install -y neofetch

# Install Git (version control system)
sudo apt install -y git

# Install i3 window manager with necessary utilities
sudo apt install -y i3 i3status dmenu i3lock xbacklight feh
sudo apt install -y i3blocks
# Install some useful utilities for i3 environment
sudo apt install -y scrot # screenshot tool
sudo apt install -y nitrogen # wallpaper setter

# Install VLC media player (optional, for media playback)
sudo apt install -y vlc

# Install Firefox web browser (optional)
sudo apt install -y firefox

# Install visual editor (vim or nano or emacs based on preference)
sudo apt-get install -y ninja-build gettext cmake unzip curl build-essential
git clone https://github.com/neovim/neovim
cd neovim 
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo 
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
cd ~
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# Optional: Install Docker (containerization tool)
sudo apt install -y docker.io

sudo apt install -y docker-compose

sudo apt install -y timeshift


mv ~/.dotfiles/i3 ~/.config/i3
mv ~/.dotfiles/nvim/ ~/.config/nvim
mv ~/.dotfiles/tmux/ ~/.config/tmux

# Clean up
sudo apt autoremove -y
sudo apt clean

echo "Installation Complete! Reboot your system if necessary."
