# -*- Shell-script -*-

. ~/.common-initialization.sh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt \
    appendhistory \
    autocd \
    autopushd \
    correct \
    notify \
    nullglob

unsetopt \
    beep

bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/home/blake/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
