# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# My custom oh-my-zsh config location
ZSH_CUSTOM=$HOME/.dotfiles/oh-my-zsh

# Oh-my-zsh theme loading
ZSH_THEME="agnoster-remco"

# Virtualenvwrapper options
export WORKON_HOME=$HOME/Environments
export PROJECT_HOME=$HOME/Projects

# Load local zshrc if it exists, this also contains local paths so should be done before any plugin loading 
# or further plugins
if [[ -f $HOME/.zshrc_local ]]; then
    source $HOME/.zshrc_local
fi

# Oh-my-zsh plugin loading
plugins=(git mercurial python autojump virtualenv virtualenvwrapper brew bower cp django github heroku history pip tmux virtualenv-prompt)

# List directory contents after a 'cd'
#function chpwd() {
#    emulate -LR zsh
#    ls
#}

# Color listing
eval $(dircolors ~/.dir_colors)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


source $ZSH/oh-my-zsh.sh
