# If not running interactively, don't do anything                                                 
[ -z "$PS1" ] && return

export DOTDIR=$HOME/.dotfiles

$DOTDIR/bin/auto-update.sh

# Source files containing the real deal
source $DOTDIR/bash/config.sh
source $DOTDIR/bash/paths.sh
source $DOTDIR/bash/aliases.sh
source $DOTDIR/bash/completions.sh
source $DOTDIR/bash/prompt.sh

# Source settings from system local .bashrc
if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi

