source ~/.dotfiles/bash/completions/virtualenv.sh
source ~/.dotfiles/bash/completions/django.sh
source ~/.dotfiles/bash/completions/mercurial.sh
source ~/.dotfiles/bash/completions/git.sh
source ~/.dotfiles/bash/completions/subversion.sh
source ~/.dotfiles/bash/completions/upto.sh

# Different local bash completions
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
