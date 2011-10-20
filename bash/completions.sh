source ~/.dotfiles/bash/completions/virtualenv.sh
source ~/.dotfiles/bash/completions/django.sh

# Different local bash completions
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
