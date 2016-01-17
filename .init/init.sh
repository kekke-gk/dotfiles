#!/usr/bin/sh

# vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/backup
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# zsh
chsh -s $(which zsh)

# urxvt
# pacman -S urxvt-perls

# Awesome
# yaourt -S lain-git
