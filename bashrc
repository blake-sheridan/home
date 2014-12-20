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

# Ubuntu seems to not want me to easily use 256 colors
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# Types
BLOCK_DEVICE='1;33;40'     # bold -- yellow / black
CHARACTER_DEVICE='1;33;40' # bold -- yellow / black
DIRECTORY='1;33'           # bold -- yellow
FILE='0'
NAMED_PIPE='1;33;40'       # bold -- yellow / black
SOCKET='1;35'              # bold -- purple
SYMBOLIC_LINK='1;33;40'    # bold -- yellow / black

# Permissions
EXECUTABLE='1;31'          # bold --    red
SETUID='37;41'             #           gray / red
SETGID='30;43'             #              ? / yellow

# Attributes
ORPHANED_LINK='1;31;40'    # bold --    red / black

export LS_COLORS="\
bd=${BLOCK_DEVICE}:\
cd=${CHARACTER_DEVICE}:\
di=${DIRECTORY}:\
ex=${EXECUTABLE}:\
ln=${SYMBOLIC_LINK}:\
or=${ORPHANED_LINK}:\
pi=${NAMED_PIPE}:\
so=${SOCKET}:\
sg=${SETGID}:\
su=${SETUID}"\

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
