#!/usr/bin/sh

# Multilib
vim /etc/pacman.conf

# Yaourt
repo='
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch'
echo "$repo" >> /etc/pacman.conf
pacman --noconfirm -Syy python yaourt

# Arch Linux
./archPkgInstall.py

# Zsh
su -l kekke -c 'chsh -s $(which zsh)'

# Dein.vim
mkdir -p ~/.vim/dein
curl -L https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s ~/.vim/dein

# Dvorak
ln -s ~/.dotfiles/.init/aoeu /usr/local/bin/
ln -s ~/.dotfiles/.init/asdf /usr/local/bin/

# Nemo
./nemo.sh

# Android
./android.sh

# Python
./python.sh

# Mozc
/usr/lib/mozc/mozc_tool --mode=config_dialog
