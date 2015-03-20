# terminal prompt
PS1='%F{green}%* %n@%m %~> %f'

# aliases
alias ls='LC_COLLATE=C ls --color=auto'
alias lsa='ls -a'
alias lsl='ls -lh'
alias lsla='ls -lha'
alias ls-symbols='ls -lfd [\!_]* _*'

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

# make
alias m='make --jobs=8 --no-builtin-rules --no-builtin-variables --warn-undefined-variables'

alias sudo='sudo '
alias sshscan='nmap -p 22 --open -sV 192.168.2.0/24'
alias tmux='TERM=xterm-256color tmux'

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

    export PATH=~/.local/bin:$PATH
fi

## LS_COLORS

bold='1'
italic='3'
underline='4'
invert='7'
conceal='8'
strikethrough='9'

foreground_='3'
background_='4'

_black='0'
_red='1'
_green='2'
_yellow='3'
_blue='4'
_magenta='5'
_cyan='6'
_white='7'
_8_bit_='8;5;'  # n
_24_bit_='8;2;' # r;g;b

bd=$foreground_$_magenta      # block device
cd=$foreground_$_cyan         # character device
di=$foreground_$_8_bit_'226'  # directory
ex=$foreground_$_red          # executable
ln=$foreground_$_yellow       # symbolic link
ol=$background_$_red          # orphaned link
pi=$foreground_$_cyan         # named pipe
sg=$background_$_magenta      # setgid
so=$foreground_$_magenta      # socket
su=$background_$_magenta      # setuid

export LS_COLORS="\
bd=${bd}:\
cd=${cd}:\
di=${di}:\
ex=${ex}:\
ln=${ln}:\
or=${or}:\
pi=${pi}:\
sg=${sg}:\
so=${so}:\
su=${su}"
