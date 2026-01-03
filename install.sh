#!/usr/bin/env bash
# Debian System Setup Script

echo "Updating system packages"
sudo apt update && sudo apt upgrade -y

echo "Installing base utilities and build tools"
sudo apt install -y --no-install-recommends \
    curl wget ca-certificates gnupg lsb-release apt-transport-https \
    git unzip zip tar jq stow \
    build-essential \
    cmake make ripgrep xclip gcc \
    ninja-build \
    pkg-config \
    gettext \
    htop

echo "Installing development libraries"
sudo apt install -y --no-install-recommends \
    libfreetype6-dev \
    libfontconfig1-dev \
    libxcb-xfixes0-dev \
    libncurses5-dev

echo "Installing networking tools"
sudo apt install -y --no-install-recommends \
    net-tools \
    nmap \
    netcat-openbsd \
    wireshark \
    tcpdump


echo "Installing and configuring firewall"
sudo apt install -y --no-install-recommends \
    ufw \
    fail2ban

sudo ufw --force enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
echo "UFW configured (deny incoming, allow outgoing, allow SSH)"


# Bluetooth
echo "Installing Bluetooth tools"
sudo apt install -y --no-install-recommends blueman

echo "Installing Sway/Wayland environment"
sudo apt install -y --no-install-recommends \
    sway \
    waybar \
    swayidle \
    swaylock \
    sway-notification-center \
    wlogout \
    wl-clipboard \
    xdg-desktop-portal-wayland \
    grim \
    slurp \
    swaybg \
    fuzzel


echo "Installing terminals, shells, and editors..."
sudo apt install -y --no-install-recommends \
    alacritty \
    zsh \
    tmux \
    nvim \
    ranger \
    fuzzel \
    thunar \
    thunar-archive-plugin

# Install Oh-My-Zsh 
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

sudo apt install -y brightnessctl pulseaudio pavucontrol

echo "Installing Docker, backup, and media tools"
sudo apt install -y --no-install-recommends \
    docker.io \
    docker-compose \
    timeshift \
    vlc \
    flameshot

echo "Installing WireGuard"
sudo apt install -y --no-install-recommends \
    wireguard \
    wireguard-tools

# Clang / LLVM toolchain
echo "Installing Clang/LLVM"
sudo apt install -y --no-install-recommends \
    clang \
    clang-format \
    clang-tidy \
    lld \
    lldb \
    llvm-dev \
    libc++-dev \
    libc++abi-dev

# Set clang as default compiler in zshrc
if ! grep -q 'export CC=clang' ~/.zshrc 2>/dev/null; then
    echo 'export CC=clang' >> ~/.zshrc
    echo 'export CXX=clang++' >> ~/.zshrc
fi

# Java (for Ghidra and other tools)
echo "Installing Java"
sudo apt install -y --no-install-recommends default-jdk

echo "Installing reverse engineering and analysis tools"
sudo apt install -y --no-install-recommends \
    gdb \
    gdbserver \
    binutils \
    radare2 \
    strace \
    ltrace \
    valgrind \
    qemu \
    qemu-user \
    qemu-user-static \
    qemu-system \
    yara \
    upx \
    binwalk \
    gcc-multilib \
    g++-multilib

echo "Installing cybersecurity tools"
sudo apt install -y --no-install-recommends \
    aircrack-ng \
    hydra \
    nikto \
    gobuster \
    sqlmap \
    hashcat \
    john \
    lynis

echo "Setting up Python"
sudo apt install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv


PYBIN="$HOME/.local/bin"
if ! grep -q "export PATH=\"$PYBIN:\$PATH\"" ~/.zshrc 2>/dev/null; then
    echo "export PATH=\"$PYBIN:\$PATH\"" >> ~/.zshrc
fi
export PATH="$PYBIN:$PATH"


echo "installing pwndbg-gdb"
curl -qsL 'https://install.pwndbg.re' | sh -s -- -t pwndbg-gdb

# Download librewolf
sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y

# Download the Mullvad signing key
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
# Add the Mullvad repository server to apt
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable stable main" | sudo tee /etc/apt/sources.list.d/mullvad.list
# Install the package
sudo apt update
sudo apt install mullvad-browser


sudo apt install -y --no-install-recommends qbittorrent

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.asc | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client


echo "Installing protonvpn"
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
sudo apt install proton-vpn-gnome-desktop -y
sudo apt install proton-vpn-cli -y 

echo "Cleaning up"
sudo apt autoremove -y
sudo apt clean

# Summary
cat << 'SUMMARY'                                                                             
manual installs:
Obsidian:
https://obsidian.md/download Download .deb
sudo dpkg -i /path/to/obsidian_x.x.x_amd64.deb
Ghidra                       
Burp Suite               
Binary Ninja       


TODO:
stow files
install fonts 
clone notes for obsidian


Post-install steps:                                                        
1. Log out and back in for group changes to take effect                 
2. Run 'chsh -s $(which zsh)' to set Zsh as default shell  


run
SUMMARY

echo ""
echo "Reboot your system: sudo reboot"
