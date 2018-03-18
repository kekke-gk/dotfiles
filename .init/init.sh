#!/usr/bin/sh

# Multilib
vim /etc/pacman.conf

# Yaourt
repo='
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch'
echo "$repo" >> /etc/pacman.conf
pacman --noconfirm -Syy yaourt

# Arch Linux
./archPkgInstall.py

# Zsh
# su -l kekke -c 'chsh -s $(which zsh)'

# Git
# ./git.sh

# Dein.vim
# mkdir -p ~/.vim/dein
# curl -L https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s ~/.vim/dein

# Dvorak
cp cmds/* /usr/local/bin/

# Nemo
./nemo.sh

# Python
# ./python.sh

# Mozc
/usr/lib/mozc/mozc_tool --mode=config_dialog
