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
    meson \
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
    tcpdump \
    dnsutils \
    inetsim 
    
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
echo "Installing Oh My Zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
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

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup update

# Go
sudo apt install -y golang
mkdir -p $HOME/go/{bin,src,pkg}

# PostgreSQL + SQLite
sudo apt install -y postgresql postgresql-contrib sqlite3

# Dbeaver
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce_latest_amd64.deb
sudo apt -f install   # fixes missing dependencies

# Java (for Ghidra and other tools)
echo "Installing Java"
sudo apt install -y --no-install-recommends default-jdk

echo "Installing reverse engineering and analysis tools"
sudo apt install -y --no-install-recommends \
    gdb \
    gdbserver \
    binutils \
    strace \
    ltrace \
    valgrind \
    qemu-user \
    qemu-user-static \
    qemu-system \
    yara \
    binwalk \
    gcc-multilib \
    g++-multilib

mkdir -p "$HOME/tools"

echo "Installing GEF"
if [ ! -d "$HOME/tools/gef" ]; then
    git clone https://github.com/hugsy/gef.git "$HOME/tools/gef"
fi

echo "Installing pwndbg"
if [ ! -d "$HOME/tools/pwndbg" ]; then
    git clone https://github.com/pwndbg/pwndbg.git "$HOME/tools/pwndbg"
    (cd "$HOME/tools/pwndbg" && ./setup.sh)
fi

echo "Installing cybersecurity tools"
sudo apt install -y --no-install-recommends \
    aircrack-ng \
    hydra \
    gobuster \
    sqlmap \
    hashcat \
    john \

echo "Setting up Python"
sudo apt install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv

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

# Summary (also saved to TODO.md)
cat << 'SUMMARY' | tee TODO.md
# Manual installs:
**Obsidian:**
https://obsidian.md/download Download .deb
sudo dpkg -i /path/to/obsidian_x.x.x_amd64.deb

**Ghidra**    
mkdir -p $HOME/tools/ghidra
Download the latest release: Go to Ghidra Releases or GitHub releases.
Download the .zip file (e.g., ghidra_12.0.1_PUBLIC_20260114.zip).
unzip ~/Downloads/ghidra_latest.zip -d $HOME/tools
Edit  ~/.zshrc:
export PATH="$HOME/tools/ghidra/ghidra_12.0.1_PUBLIC_20260114:$PATH"

**Cutter**
mkdir -p $HOME/tools/cutter
cd $HOME/tools/cutter
wget https://github.com/rizinorg/cutter/releases/download/v2.4.1/Cutter-v2.4.1-Linux-Qt5-x86_64.AppImage
chmod +x Cutter-v2.4.1-Linux-Qt5-x86_64.AppImage
mv Cutter-v2.4.1-Linux-Qt5-x86_64.AppImage cutter

**Rizin**
cd $HOME/tools/
git clone https://github.com/rizinorg/rizin
$ meson setup build
$ meson compile -C build
$ sudo meson install -C build


TODO:
Run 'chsh -s $(which zsh)' to set Zsh as default shell  
Log out and back in for group changes to take effect      
stow files
install fonts 
clone notes for obsidian
SUMMARY

echo ""
echo "Reboot your system: sudo reboot"
