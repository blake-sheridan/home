# -*- Shell-script -*-

. ~/.common-initialization.sh

# relax for typos and case
shopt -s cdspell
shopt -s nocaseglob

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
