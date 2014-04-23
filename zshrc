# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# My custom oh-my-zsh config location
ZSH_CUSTOM=$HOME/.dotfiles/oh-my-zsh

# Oh-my-zsh theme loading
ZSH_THEME="agnoster-remco"

# Virtualenvwrapper options
export WORKON_HOME=$HOME/Environments
export PROJECT_HOME=$HOME/Projects

export DISABLE_AUTO_TITLE="true"

# Oh-my-zsh plugin loading
plugins=(profiles git mercurial python autojump virtualenv virtualenvwrapper brew bower cp django github heroku history tmux virtualenv-prompt colored-man dirhistory extract history-substring-search jump per-directory-history colorize sudo vagrant)

source $ZSH/oh-my-zsh.sh

# Change default color of history substring to 
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=black,fg=green"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=black,fg=red"

# Color listing
# XXX move this to a plugin?
eval $(dircolors ~/.dir_colors)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# By default use colorize for viewing files
alias cat="colorize"
