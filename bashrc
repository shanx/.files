# If not running interactively, don't do anything                                                 
[ -z "$PS1" ] && return

# Auto update local dotfiles on remote systems
if [ -n "${SSH_CLIENT}" ]; then 
    git pull ~/.dotfiles
    dotfiles --sync
fi

# Source files containing the real deal
source ~/.dotfiles/bash/config.sh
source ~/.dotfiles/bash/paths.sh
source ~/.dotfiles/bash/aliases.sh
source ~/.dotfiles/bash/completions.sh
source ~/.dotfiles/bash/prompt.sh

# Source settings from system local .bashrc
if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi

