source ~/.dotfiles/bash/completions/virtualenv.sh
source ~/.dotfiles/bash/completions/django.sh

if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi
