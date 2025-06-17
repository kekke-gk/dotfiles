# Mode
# bindkey -v # vi
bindkey -e # emacs

# Prompt
PROMPT='[%n@%m]$ '
RPROMPT='[%~]'
SPROMPT="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# home end delete
bindkey "^[[H"  beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[3~" delete-char
bindkey "^U" backward-kill-line

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

setopt nolistbeep

# Complement
setopt correct
autoload -U compinit; compinit # 補完機能を有効にする
# setopt complete_aliases
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
alias ls='gls --color=auto'
alias ll='ls -Al'
alias la='ls -A'
alias l='ls -CF'
alias mv='mv -i'
alias grep='grep --color'
alias vi='nvim'
alias vim='nvim'
alias xclip='xclip -sel clip'
alias view='nvim -R'
alias pstree="pstree -A"
alias tmux="TERM=screen-256color-bce tmux"
board() {ssh -L "6006:$1:6006" $1}
forward() {
    if [[ -z $1 ]]; then
        echo "Usage: forward <host> [port1 port2 port3 ...]"
        return 1
    fi

    local host=$1
    shift  # 残りの引数をポート番号として処理

    # デフォルト: ポート指定がなければ6006, 8888
    if [[ $# -eq 0 ]]; then
        set -- 6006 8888
    fi

    local port_args=()

    for port in $@; do
        port_args+=("-L" "${port}:localhost:${port}")
    done

    ssh ${port_args[@]} ${host}
}

function chpwd() { ls -G --color=auto }

g+() { g++ -o "${1%.*}.out" "$1"; }
gc() { gcc -o "${1%.*}.out" "$1"; }

# alias -s txt=cat

export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export XMODIFIERS="@im=uim"
# export GTK_IM_MODULE=ibus
# export QT_IM_MODULE=ibus
# export XMODIFIERS="@im=ibus"

PATH+=:"$(ruby -e 'print Gem.user_dir')/bin"
PATH+=:"$HOME/.local/bin"
export PATH
export XDG_CONFIG_HOME=$HOME/.config
export LANG=en_US.UTF-8

# yaourt
export VISUAL=nvim
export EDITOR=nvim

export JAVA_HOME=/opt/homebrew/opt/openjdk@21
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=""
export CPPFLAGS="-I$JAVA_HOME/include"

fpath=(~/.zsh/completion $fpath)

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

# haskell
[ -f "/Users/kekke/.ghcup/env" ] && . "/Users/kekke/.ghcup/env" # ghcup-env

if [[ `tty` =~ .*pts.* && -z "$TMUX" && ! -z "$PS1" ]]; then
    ID="`tmux ls 2> /dev/null`"
    # if [[ -z "$ID" ]]; then
    #     exec tmux -2
    # else
    cns="Create New Session"
    [[ -z "$ID" ]] && ID="${cns}:" || ID="${cns}:\n$ID"
    ID="`echo $ID | fzf | cut -d: -f1`"
    if [[ "$ID" == "${cns}" ]]; then
        exec tmux -2
    elif [[ -n "$ID" ]]; then
        exec tmux -2 attach-session -t "$ID"
    else
        :
    fi
    # fi
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kekke/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kekke/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kekke/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kekke/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[[ -z $TMUX ]] || conda deactivate; conda activate base


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kekke/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kekke/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kekke/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kekke/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


alias git-https="git remote set-url origin https://github.com/$(git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
alias git-ssh="  git remote set-url origin git@github.com:$(    git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"

export PATH=$PATH:/Users/kekke/git/browser/depot_tools

