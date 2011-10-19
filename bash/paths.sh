PATH=$PATH:~/.dotfiles/bin/

# Include local bin directory in path if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

export PATH
