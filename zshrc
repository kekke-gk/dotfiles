#
# Mode
# bindkey -v # vi
bindkey -e # emacs

# Prompt
PROMPT='[%n@%m]# '
RPROMPT='[%d]'

# home end delete
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'


# Complement
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
compctl -M 'm:{a-z}={A-Z}'




SPROMPT="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"



 
# alias
alias ls='ls -G --color=auto'
alias ll='ls -All'
alias la='ls -A'
alias l='ls -CF'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias xclip='xclip -sel clip'
alias open='gnome-open'
alias view='vim -R'
alias pstree="pstree -A"

export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export XMODIFIERS="@im=uim"

export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

# yaourt
export VISUAL="vim"
# enhancd
if [ -f "/home/kekke/.enhancd/zsh/enhancd.zsh" ]; then
    source "/home/kekke/.enhancd/zsh/enhancd.zsh"
fi
