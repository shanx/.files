# If not running interactively, don't do anything                                                 
[ -z "$PS1" ] && return

# Auto update local dotfiles on remote systems
# Once every hour
if [ -n "${SSH_CLIENT}" ]; then 

    LAST_UPDATED=`stat --format '%Y' ~/.dotfiles/.last_updated`
    CURRENT_TIME=`date +%s`
    DELTA_TIME=$(($CURRENT_TIME - $LAST_UPDATED))

    if [ $DELTA_TIME -gt 3600 ]; then
        cd ~/.dotfiles
        git pull
        git submodule update
        ~/.dotfiles/.venv/bin/pip install --upgrade dotfiles
        ~/.dotfiles/.venv/bin/dotfiles --sync
        # Update the file
        touch ~/.dotfiles/last_updated
        cd -
    fi
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

