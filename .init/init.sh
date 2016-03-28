#!/usr/bin/sh

# Vim
# mkdir -p ~/.vim/swap
# mkdir -p ~/.vim/backup

## Dein.vim
mkdir -p ~/.vim/dein
curl -L https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s ~/.vim/dein

# Arch Linux
python ./archPkgInstall.py

# Zsh
chsh -s $(which zsh)

# Dvorak
sudo ln -s ~/.dotfiles/.init/aoeu /usr/local/bin/
sudo ln -s ~/.dotfiles/.init/asdf /usr/local/bin/

# Mozc
/usr/lib/mozc/mozc_tool --mode=config_dialog
