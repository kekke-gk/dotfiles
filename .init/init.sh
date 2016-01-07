#!/usr/bin/sh

# vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/backup
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
yaourt -S python-powerline

# zsh
chsh -s $(which zsh)

# urxvt
pacman -S urxvt-perls

# Awesome
yaourt -S lain-git

cp -r /usr/lib/python3.5/site-packages/powerline /usr/lib/python2.7/site-packages
