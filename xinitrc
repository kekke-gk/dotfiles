setxkbmap dvorak
xmodmap ~/.Xmodmap
/* [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources */
xrdb -I$HOME ~/.Xresources
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'
/* exec tdm --xstart */
exec awesome
/* exec startkde */
/* exec startxfce4 */
