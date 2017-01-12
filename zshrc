# Mode
# bindkey -v # vi
bindkey -e # emacs

# Prompt
PROMPT='[%n@%m]$ '
RPROMPT='[%d]'
SPROMPT="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

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
setopt auto_cd
function chpwd() { ls -G --color=auto }
setopt auto_pushd
setopt pushd_ignore_dups
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

setopt nolistbeep

# Complement
setopt correct
autoload -U compinit; compinit # 補完機能を有効にする
# autoload predict-on; predict-on
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
compctl -M 'm:{a-z}={A-Z}'

setopt ignore_eof

stty stop undef

# alias
alias ls='ls --color=auto'
alias ll='ls -Al'
alias la='ls -A'
alias l='ls -CF'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias xclip='xclip -sel clip'
# alias open='gnome-open'
alias open='xdg-open'
alias view='vim -R'
alias pstree="pstree -A"
alias tmux="TERM=screen-256color-bce tmux"

g+() { g++ -o "${1%.*}" "$1"; }

export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export XMODIFIERS="@im=uim"

PATH+=:"$(ruby -e 'print Gem.user_dir')/bin"
export PATH
export XDG_CONFIG_HOME=$HOME/.config
export LANG=en_US.UTF-8
# export LANG=ja_JP.UTF-8

# yaourt
export VISUAL=vim
export EDITOR=vim

if [ -f ~/.dircolors ]; then
    if type dircolors > /dev/null 2>&1; then
        eval $(dircolors ~/.dircolors)
    elif type gdircolors > /dev/null 2>&1; then
        eval $(gdircolors ~/.dircolors)
    fi
fi

if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi
