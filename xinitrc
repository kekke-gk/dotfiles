setxkbmap dvorak
xmodmap ~/.Xmodmap
xrdb -I$HOME ~/.Xresources
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
export XMODIFIERS='@im=uim'
uim-xim &
/* export GTK_IM_MODULE='ibus' */
/* export QT_IM_MODULE='ibus' */
/* export XMODIFIERS='@im=ibus' */
/* ibus-daemon -drx */
/* export http_proxy=http://proxy.uec.ac.jp:8080/ */
/* export https_proxy=$http_proxy */
/* export ftp_proxy=$http_proxy */
/* export rsync_proxy=$http_proxy */
/usr/bin/xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &
xset r rate 200 30
/* exec cinnamon-session */
exec awesome
/* exec startkde */
/* exec startxfce4 */
