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
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# MOVE ZSH CONFIG INTO ZSHRC

# Install Alacritty terminal (with dependencies)
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
sudo apt install -y alacritty

# Install Rust 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install net-tools (for networking tools like ifconfig)
sudo apt install -y net-tools

# Install Nmap for network exploration
sudo apt install -y nmap

sudo apt install -y blueman 
# Install netcat (utility for reading and writing network connections)
sudo apt install -y netcat-openbsd

# Install Wireshark
sudo apt install -y wireshark

# Install htop (interactive process viewer)
sudo apt install -y htop

# Install neofetch (system information tool)
sudo apt install -y neofetch

# Install Git (version control system)
sudo apt install -y git

# Install i3 window manager with necessary utilities
sudo apt install -y i3status dmenu xbacklight feh
sudo apt install -y i3blocks
sudo apt install -y sway
# Install some useful utilities for i3 environment
sudo apt install -y scrot # screenshot tool
sudo apt install -y nitrogen # wallpaper setter

# jdk
curl -O https://download.oracle.com/java/24/latest/jdk-24_linux-x64_bin.tar.gz
tar -xzf jdk-21*.tar.gz
sudo mv jdk-21* /opt/
source ~/.zshrc

# python
sudo apt-get install python3-pip


sudo apt install -y vlc
sudo apt install -y firefox

# nvim
sudo apt-get install -y ninja-build gettext cmake unzip curl build-essential
git clone https://github.com/neovim/neovim
cd neovim 
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo 
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
cd ~
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install docker
sudo apt install -y docker.io
sudo apt install -y docker-compose

# backup
sudo apt install -y timeshift


mv ~/.dotfiles/i3 ~/.config/sway
mv ~/.dotfiles/nvim/ ~/.config/nvim
mv ~/.dotfiles/tmux/ ~/.config/tmux

# Clean up
sudo apt autoremove -y
sudo apt clean

echo "Installation Complete! Reboot your system if necessary."
