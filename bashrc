# If not running interactively, don't do anything                                                 
[ -z "$PS1" ] && return

# Source files containing the real deal
source ~/.dotfiles/bash/config.sh
source ~/.dotfiles/bash/paths.sh
source ~/.dotfiles/bash/aliases.sh
source ~/.dotfiles/bash/completions.sh
source ~/.dotfiles/bash/prompt.sh

# bash completion, see: http://www.debian-administration.org/article/An_introduction_to_bash_completion_part_1
#if [ -f /opt/local/etc/bash_completion ]; then
#  . /opt/local/etc/bash_completion
#fi

# Source settings from system local .bashrc
if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi

