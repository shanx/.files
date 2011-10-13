# Custom bash prompt
#export PS1="\u@\h:\W $ "
export PS1='\W $(vcprompt --format="[%s:%b]")\$ '

# History control
export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend
# Make sure all terminals save history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export INPUTRC=~/.inputrc 


# Set locale to utf-8 version
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export EDITOR='vim'
export SVN_MERGE='fmdiff3'

# Set emacs as default editing mode
set -o emacs

# Colorize grep output
export GREP_OPTIONS='--color=auto'

# Faster directory traversal
source .dotfiles/bin/z.sh
