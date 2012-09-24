#!/bin/bash

# Auto update local dotfiles on remote systems
# Once every hour
if [ -n "${SSH_CLIENT}" ]; then 

    LAST_UPDATED=`stat --format '%Y' ~/.dotfiles/.last_updated`
    CURRENT_TIME=`date +%s`
    DELTA_TIME=$(($CURRENT_TIME - $LAST_UPDATED))

    if [ $DELTA_TIME -gt 3600 ]; then
        cd ~/.dotfiles
        git pull
        git submodule init
        git submodule update
        ~/.dotfiles/.venv/bin/pip install dotfiles==0.4.4 --quiet
        ~/.dotfiles/.venv/bin/dotfiles --sync
        # Update the file
        touch ~/.dotfiles/.last_updated
        cd ~
    fi
fi
