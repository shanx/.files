cd ~/.dotfiles
# Auto add submodules
git submodule init
git submodule update

# Install dotfiles
virtualenv ~/.dotfiles/.venv --no-site-packages
~/.dotfiles/.venv/bin/pip install dotfiles
#ln -s ~/.dotfiles/.venv/bin/dotfiles ~/.dotfiles/bin/dotfiles
ln -s ~/.dotfiles/dotfilesrc ~/.dotfilesrc
dotfiles --sync

# Create last_updated file
touch ~/.dotfiles/.last_updated
