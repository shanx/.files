add_to_path ~/.dotfiles/bin/

# Include local bin directory in path if it exists
if [ -d ~/bin ] ; then
    add_to_path ~/bin
fi
