# -*- Shell-script -*-

# terminal prompt
PS1="\[\e[1;32m\]\A \u@\h \w>\[\e[0;0m\] "

# relax for typos and case
shopt -s cdspell
shopt -s nocaseglob

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
alias emacs='emacs -nw'

# git
alias ad='git add -p'
alias d='git diff'
alias co='git checkout -p'
alias st='git status'

alias sudo='sudo '
alias ssh-scan="nmap -p 22 --open -sV 192.168.2.0/24"

if [ -z "$_BLAKE_BASHRC" ] ; then
    export _BLAKE_BASHRC=1

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

# change directory colors
eval `dircolors -b ~/.dircolors`

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
