# History control
export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend
# Make sure all terminals save history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

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
