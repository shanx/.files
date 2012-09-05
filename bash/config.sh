# History control
export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
# Ignore certain often used commands, & erases duplicates
export HISTIGNORE="&:ls:la:[bf]g:exit"
# Have all terminals append to history (instead of overwriting)
shopt -s histappend
# Save multinline commands as single line in history
shopt -s cmdhist 
# Make sure all terminals save history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Correct often made mistakes
shopt -s cdspell

# The following options are only available in bash 4
if ((BASH_VERSINFO[0] >= 4)); then 
    # ‘**’ used in a filename expansion context will match 
    # all files and zero or more directories and subdirectories
    shopt -s globstar
    # Allow autocorrection of directories in tab expansion
    shopt -s dirspell
    # Allow cd without using cd
    shopt -s autocd
fi

# Put key mappings in inputrc
export INPUTRC=~/.inputrc 

export TERM=xterm-256color

# Set locale to utf-8 version
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export EDITOR='vim'
export SVN_MERGE='fmdiff3'

# Set emacs as default editing mode
set -o emacs
# Reformat screen on window resize
shopt -s checkwinsize

# Colorize grep output
export GREP_OPTIONS='--color=auto'

# Python settings
export VIRTUALENV_USE_DISTRIBUTE=1
# don't let virtualenv show prompts by itself
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Ignore accidental EOF (Exit shell) keystroke
export IGNOREEOF=1

# Faster directory traversal
source ~/.dotfiles/bin/z.sh
