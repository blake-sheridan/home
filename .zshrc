# terminal prompt
PS1='%F{green}%* %n@%m %~> %f'

# aliases
alias ls='LC_COLLATE=C ls --color=auto'
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

function cd-ls()
{
    if [[ "$1" = "" ]] ; then
        cd ~/
        ls
    else
        cd "$1"
        ls
    fi
}

alias cd='cd-ls'

####################################################################################################
# LS_COLORS

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
or=$background_$_red          # orphaned link
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

####################################################################################################
# PATH

typeset -U path

path=(~/.local/bin ~/tools $path)

####################################################################################################

# tab width
tabs -4

HISTFILE=~/.zsh_history
HISTSIZE=99999
SAVEHIST=$HISTSIZE

bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/home/blake/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

####################################################################################################
# Changing Directories

setopt AUTO_CD # (-J)
setopt AUTO_PUSHD # (-N)
# CDABLE_VARS (-T)
# CHASE_DOTS
# CHASE_LINKS # (-w)
# PUSHD_IGNORE_DUPS
# PUSHD_MINUS
# PUSHD_SILENT (-E)
# PUSHD_TO_HOME (-D)

####################################################################################################
# Completion

# ALWAYS_LAST_PROMPT <D>
# ALWAYS_TO_END
# AUTO_LIST (-9) <D>
# AUTO_MENU <D>
# AUTO_NAME_DIRS
# AUTO_PARAM_KEYS <D>
# AUTO_PARAM_SLASH <D>
# AUTO_REMOVE_SLASH <D>
# BASH_AUTO_LIST
# COMPLETE_ALIASES
# COMPLETE_IN_WORD
# GLOB_COMPLETE
# HAST_LIST_ALL <D>
# LIST_AMBIGUOUS <D>
# LIST_BEEP <D>
# LIST_PACKED
# LIST_ROWS_FIRST
# LIST_TYPES (-X) <D>
# MENU_COMPLETE (-Y)
# REC_EXACT (-S)

####################################################################################################
# Expansion and Globbing

# BAD_PATTERN (+2) <C> <Z>
# BARE_GLOB_QUAL <Z>
# BRACE_CCL
# CASE_GLOB <D>
# CASE_MATCH <D>
# CSH_NULL_GLOB <C>
# EQUALS <Z>
# EXTENDED_GLOB
# GLOB (+F, ksh: +f) <D>
# GLOB_ASSIGN <C>
# GLOB_DOTS (-4)
# GLOB_SUBSTR <C> <K> <S>
# HIST_SUBST_PATTERN
# IGNORE_BRACES (-I) <S>
# KSH_GLOB <K>
# MAGIC_EQUAL_SUBST
# MARK_DIRS (-8, ksh: -X)
# MULTIBYTE <C> <K> <Z>
# NOMATCH (+3) <C> <Z>
setopt NULL_GLOB # (-G)
# NUMERIC_GLOB_SORT
# RC_EXPAND_PARAM (-P)
# REMATCH_PCRE <Z>
# SH_GLOB <K> <S>
# UNSET (+u, ksh: +u) <K> <S> <Z>
# WARN_CREATE_GLOBAL

####################################################################################################
# History

# APPEND_HISTORY <D>
# BANG_HIST (+K) <C> <Z>
# EXTENDED_HISTORY <C>
# HIST_ALLOW_CLOBBER
# HIST_BEEP <D>
# HIST_EXPIRE_DUPS_FIRST
# HIST_FCNTL_LOCK
# HIST_FIND_NO_DUPS
# HIST_IGNORE_ALL_DUPS
# HIST_IGNORE_DUPS # (-h)
# HIST_IGNORE_SPACE (-g)
# HIST_NO_FUNCTIONS
# HIST_NO_STORE
# HIST_REDUCE_BLANKS
# HIST_SAVE_BY_COPY <D>
# HIST_SAVE_NO_DUPS
# HIST_VERIFY
# INC_APPEND_HISTORY
# SHARE_HISTORY <K>

####################################################################################################
# Initialisation

# ALL_EXPORT (-a, ksh: -a)
# GLOBAL_EXPORT (<Z>)
# GLOBAL_RCS (-d) <D>
# RCS (+f) <D>

####################################################################################################
# Input/Output

# ALIASES <D>
# CLOBBER (+C, ksh: +C) <D>
setopt CORRECT # (-0)
# CORRECT_ALL (-O)
# DVORAK
# FLOW_CONTROL <D>
# IGNORE_EOF (-7)
# INTERACTIVE_COMMENTS (-k) <K> <S>
# HASH_CMDS <D>
# HASH_DIRS <D>
# MAIL_WARNING (-U)
# PATH_DIRS (-Q)
# PRINT_EIGHT_BIT
# PRINT_EXIT_VALUE (-1)
# RC_QUOTES
# RM_STAR_SILENT (-U) <K> <S>
# RM_STAR_WAIT
# SHORT_LOOPS <C> <Z>
# SUN_KEYBOARD_HACK (-L)

####################################################################################################
# Job Control

# AUTO_CONTINUE
# AUTO_RESUME (-W)
# BG_NICE (-6) <C> <Z>
# CHECK_JOBS <Z>
# HUP <Z>
# LONG_LIST_JOBS (-R)
# MONITOR (-m, ksh: -m)
setopt NOTIFY # (-5, ksh: -b) <Z>

####################################################################################################
# Prompting

# PROMPT_BANG <K>
# PROMPT_CR (+V) <D>
# PROMPT_SP <D>
# PROMPT_PERCENT <C> <Z>
# PROMPT_SUBST <K> <S>
# TRANSIENT_RPROMPT

####################################################################################################
# Scripts and Functions

# C_BASES
# C_PRECEDENCES
# DEBUG_BEFORE_CMD
# ERR_EXIT (-e, ksh: -e)
# ERR_RETURN
# EVAL_LINENO <Z>
# EXEC (+n, ksh: +n) <D>
# FUNCTION_ARGZERO <C> <Z>
# LOCAL_OPTIONS <K>
# LOCAL_TRAPS <K>
# MULTI_FUNC_DEF <Z>
# MULTIOS <Z>
# OCTAL_ZEROES <S>
# TYPESET_SILENT
# VERBOSE (-v, ksh: -v)
# XTRACE (-x, ksh: -x)

####################################################################################################
# Shell Emulation

# BASH_REMATCH
# BSD_ECHO <S>
# CSH_JUNKIE_HISTORY <C>
# CSH_JUNKIE_LOOPS <C>
# CSH_JUNKIE_QUOTES <C>
# CSH_NULLCMD <C>
# KSH_ARRAYS <K> <S>
# KSH_AUTOLOAD <K> <S>
# KSH_OPTION_PRINT <K>
# KSH_TYPESET <K>
# KSH_ZERO_SUBSCRIPT
# POSIX_ALIASES <K> <S>
# POSIX_BUILTINS <K> <S>
# POSIX_IDENTIFIERS <K> <S>
# SH_FILE_EXPANSION <K> <S>
# SH_NULLCMD <K> <S>
# SH_OPTION_LETTERS <K> <S>
# SH_WORD_SPLIT (-y) <K> <S>
# TRAPS_ASYNC

####################################################################################################
# Shell State

# INTERACTIVE (-i, ksh: -i)
# LOGIN (-l, ksh: -l)
# PRIVILEGED (-p, ksh: -p)
# RESTRICTED (-r)
# SHIN_STDIN (-s, ksh: -s)
# SINGLE_COMMAND (-t, ksh: -t)

####################################################################################################
# Zle

unsetopt BEEP # (+B) <D>
# COMBINING_CHARS
# EMACS
# OVERSTRIKE
# SINGLE_LINE_ZLE (-M) <K>
# VI
# ZLE (-Z)
