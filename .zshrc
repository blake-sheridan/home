# -*- Shell-script -*-

# terminal prompt
PS1='%F{green}%* %n@%m %~> %f'

# aliases
alias ls='ls --color=auto'
alias lsa='ls -a'
alias lsl='ls -lh'
alias lsla='ls -lha'

alias cb='cd $OLDPWD'
alias x='exit'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# emacs
alias e='emacs'
alias emacs='TERM=xterm-256color emacs -nw'

# git
alias ad='git add -p'
alias d='git diff'
alias co='git checkout -p'
alias st='git status'

alias sudo='sudo '
alias sshscan='nmap -p 22 --open -sV 192.168.2.0/24'

if [ -z "$_BLAKE_ZSHRC" ] ; then
    export _BLAKE_ZSHRC=1

    function mycd()
    {
        if [[ "$1" = "" ]] ; then
            cd ~/
            ls
        else
            cd "$1"
            ls
        fi
    }

    alias cd='mycd'

    export PATH=~/scripts:$PATH
fi

# Solarized colors
BASE03='234'
BASE02='235'
BASE01='240'
BASE00='241'
BASE0='244'
BASE1='245'
BASE2='254'
BASE3='230'
YELLOW='136'
ORANGE='166'
RED='160'
MAGENTA='125'
VIOLET='61'
BLUE='33'
CYAN='37'
GREEN='64'

# Types
BLOCK_DEVICE='38;5;'$MAGENTA
CHARACTER_DEVICE='38;5;'$CYAN
DIRECTORY='38;5;226'
FILE='38;5;'$BASE1
NAMED_PIPE='38;5;'$GREEN
SOCKET='38;5;'$VIOLET
SYMBOLIC_LINK='38;5;'$YELLOW

# Attributes
EXECUTABLE='38;5;'$RED
ORPHANED_LINK='48;5;'$RED
SETUID='48;5;'$VIOLET
SETGID='48;5;'$MAGENTA

export LS_COLORS="\
bd=${BLOCK_DEVICE}:\
cd=${CHARACTER_DEVICE}:\
di=${DIRECTORY}:\
ex=${EXECUTABLE}:\
pi=${NAMED_PIPE}:\
so=${SOCKET}:\
ln=${SYMBOLIC_LINK}:\
ex=${EXECUTABLE}:\
or=${ORPHANED_LINK}:\
sg=${SETGID}:\
su=${SETUID}"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/blake/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
