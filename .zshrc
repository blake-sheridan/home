TERM=xterm-256color

alias ad='git add -p'
alias cb='cd $OLDPWD'
alias co='git checkout -p'
alias d='git diff'
alias e='TERM=xterm-256color emacs -nw'
alias g='git'
alias kill-suspended='kill -s KILL ${${(v)jobstates##*:*:}%=*}'
alias ls='LC_COLLATE=C ls --color=auto --hide="LICENSE*" --hide="README*"'
alias lsla='ls -la'
alias ls-symbols='ls -lfd [\!_]* _*'
alias m='make --jobs=8 --warn-undefined-variables'
      p() { python3 <<< "print($@)" }
alias st='git status'
alias sudo='sudo '
alias ssh-scan='nmap -p 22 --open -sV 192.168.2.0/24'
alias x='exit'

# `ls` after changing the working directory
chpwd() {
    ls
}

####################################################################################################
# LS_COLORS

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

    '*.cxx'='38;5;180'
    '*.hxx'='38;5;180'

    '*.el'='38;5;203'

    '*.md'='38;5;88'

    '*Makefile'='38;5;94'
    '*.mk'='38;5;176'

    '*.py'='38;5;142'

    '*.sh'='38;5;180'
    '*.zsh'='38;5;180'

    '*LICENSE'='38;5;238'
    '*LICENSE.txt'='38;5;238'

    '*README'='38;5;238'
    '*README.md'='38;5;238'
    '*README.txt'='38;5;238'
)

export LS_COLORS=${(j/:/)ls_colors}

zstyle ':completion:*:default' list-colors $LS_COLORS

####################################################################################################
# PATH

typeset -U path

path=(~/.local/bin ~/lib $path)

fpath=(~/.zsh/functions $fpath)

autoload\
    cursor.hide\
    cursor.show\
    find.extension\
    find.name\
    terminal.print-colors\
    window.class\
    window.class.set\
    window.geometry\
    window.name\
    window.name.set\
    window.role\
    window.role.set\
    window.spy\
    window.title\
    window.title.set

####################################################################################################

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
setopt CHASE_DOTS
setopt CHASE_LINKS # (-w)
# PUSHD_IGNORE_DUPS
# PUSHD_MINUS
setopt PUSHD_SILENT # (-E)
# PUSHD_TO_HOME (-D)

####################################################################################################
# Completion

setopt ALWAYS_LAST_PROMPT # <D>
# ALWAYS_TO_END
setopt AUTO_LIST # (-9) <D>
setopt AUTO_MENU # <D>
# AUTO_NAME_DIRS
# AUTO_PARAM_KEYS <D>
# AUTO_PARAM_SLASH <D>
# AUTO_REMOVE_SLASH <D>
# BASH_AUTO_LIST
# COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
# GLOB_COMPLETE
# HAST_LIST_ALL <D>
# LIST_AMBIGUOUS <D>
# LIST_BEEP <D>
# LIST_PACKED
# LIST_ROWS_FIRST
setopt LIST_TYPES # (-X) <D>
# MENU_COMPLETE (-Y)
# REC_EXACT (-S)

####################################################################################################
# Expansion and Globbing

setopt BAD_PATTERN # (+2) <C> <Z>
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
setopt WARN_CREATE_GLOBAL

####################################################################################################
# History

# APPEND_HISTORY <D>
# BANG_HIST (+K) <C> <Z>
setopt EXTENDED_HISTORY # <C>
# HIST_ALLOW_CLOBBER
# HIST_BEEP <D>
# HIST_EXPIRE_DUPS_FIRST
# HIST_FCNTL_LOCK
# HIST_FIND_NO_DUPS
# HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS # (-h)
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

setopt ALIASES # <D>
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

PS1="%F{4}%~⏵%f "
RPS1="%F{23}%*"

# PROMPT_BANG <K>
# PROMPT_CR (+V) <D>
# PROMPT_SP <D>
setopt PROMPT_PERCENT # <C> <Z>
setopt PROMPT_SUBST # <K> <S>
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
