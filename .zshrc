# -*- mode: shell-script -*-

alias ap='ack --python'
alias cb='cd $OLDPWD'
alias d='git diff'
alias e='emacs -nw'
alias g='git'
alias fr='find-replace'
# Delete all merged branches
alias gdmb='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
alias h='head'
alias l='ls'
alias ls='LC_COLLATE=C ls --color=auto --group-directories-first --hide="LICENSE*" --hide="__pycache__" -p'
alias lsa='ls -A'
alias lsla='ls -la'
# Kill any suspended processes
alias ks='kill -s KILL ${${(v)jobstates##*:*:}%=*}'
alias p='python3'
alias pc='pre-commit run --all-files'
alias pe='pipenv'
alias pei='pipenv install'
alias peid='pipenv install --dev'
alias pes='pipenv shell'
alias psd='python3 setup.py develop'
alias s='git status'
# Change to the current Python environment's site-packages/ directory
alias sp='cd $(python3 -c '\''for x in filter(lambda x: x.endswith("site-packages"), __import__("sys").path): print(x)'\'')'
alias sudo='sudo '
alias v='less'
alias w='pwd'
alias x='pytest --disable-warnings -x'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

#setopt ALIASES
#setopt ALWAYS_LAST_PROMPT
setopt AUTO_CD
setopt AUTO_NAME_DIRS
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_PUSHD
setopt BAD_PATTERN
unsetopt BEEP
setopt CHASE_DOTS
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt EQUALS
setopt EXTENDED_GLOB
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt LIST_PACKED
setopt LIST_TYPES
setopt NOTIFY
setopt NULL_GLOB
setopt PATH_DIRS
setopt PROMPT_PERCENT
setopt PROMPT_SUBST
setopt WARN_CREATE_GLOBAL

ls_colors=(
    bd='1;38;5;244;48;5;230'    # block device
    ca='30;41'                  # capability
    cd='1;38;5;244;48;5;230'    # character device
    di='38;5;2'                 # directory
    ex='38;5;1'                 # executable files
    ln='3;33'                   # symbolic link
    mh='0'                      # multihardlink
    no='5'                      # normal text
    or='9;38;5;160;48;5;235'    # orphaned link
    ow='38;5;33;48;5;235'       # world writable directories without sticky bit set
    pi='1;38;5;136;48;5;230'    # fifo
    rs='0'                      # reset
    sg='38;5;230;48;5;136'      # setgid
    so='1;38;5;136;48;5;230'    # socket
    st='38;5;230;48;5;33'       # directories with sticky bit set but not world writable
    su='38;5;230;48;5;160'      # setuid
    tw='38;5;230;48;5;64'       # world writable directories with sticky bit set

    '*@test'='38;5;84'

    '*.gitignore'='38;5;94'

    '*.c'='38;5;34'
    '*.h'='38;5;108'

    '*.cxx'='38;5;222'
    '*.hxx'='38;5;220'

    '*.el'='38;5;203'

    '*.ini'='38;5;74'

    '*.la'='38;5;88'

    '*.log'='38;5;130'

    '*.ac'='38;5;24'
    '*.am'='38;5;24'
    '*.in'='38;5;24'
    '*.m4'='38;5;24'

    '*.md'='38;5;214'

    '*Makefile'='38;5;22'
    '*.mk'='38;5;176'

    '*.png'='38;5;68'

    '*.py'='38;5;226'

    '*.sh'='38;5;180'
    '*.zsh'='38;5;180'

    '*.sql'='38;5;81'

    '*.txt'='38;5;253'

    '*COPYING'='38;5;238'
    '*LICENSE'='38;5;238'
    '*LICENSE.txt'='38;5;238'
)

export LS_COLORS=${(j/:/)ls_colors}
export PATH=~/bin:$PATH

HISTFILE=~/.zsh_history
HISTSIZE=99999
SAVEHIST=$HISTSIZE

# Automatic `ls` after changing the working directory
chpwd() { ls }

autoload -Uz compinit
autoload -U colors && colors
autoload -Uz vcs_info

compinit

bindkey -e

# PROMPT

precmd() { vcs_info }

zstyle ':vcs_info::*' enable git

# %r root
# %S path relative to root
# %b branch
# %m stashes
# %u unstaged changes
# %c staged changes
#zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
#zstyle ':vcs_info:git*' formats "%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
zstyle ':vcs_info:git*' actionformats "%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "

#vcs_info  # For the initial PROMPT

if ((${#SSH_TTY[@]})); then
    PS1="%F{4}%m:%~%f "
else
    PS1="%F{4}%~%f "
fi
PROMPT="
%F{23}%*${reset_color%} ${vcs_info_msg_0_}
${PS1}"
