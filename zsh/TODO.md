# manual installs:
**Obsidian:**
https://obsidian.md/download Download .deb
sudo dpkg -i /path/to/obsidian_x.x.x_amd64.deb

Ghidra    
mkdir -p $HOME/tools/ghidra
Download the latest release: Go to Ghidra Releases or GitHub releases.
Download the .zip file (e.g., ghidra_12.0.1_PUBLIC_20260114.zip).
unzip ~/Downloads/ghidra_latest.zip -d $HOME/tools
Edit  ~/.zshrc:
export PATH="$HOME/tools/ghidra/ghidra_12.0.1_PUBLIC_20260114:$PATH"

Cutter
mkdir -p $HOME/tools/cutter
cd $HOME/tools/cutter
wget https://github.com/rizinorg/cutter/releases/download/v2.4.1/Cutter-v2.4.1-Linux-Qt5-x86_64.AppImage
chmod +x Cutter-v2.4.1-Linux-Qt5-x86_64.AppImage
mv Cutter-v2.4.1-Linux-Qt5-x86_64.AppImage cutter

TODO:
Run 'chsh -s $(which zsh)' to set Zsh as default shell  
Log out and back in for group changes to take effect      
stow files
install fonts 
clone notes for obsidian
