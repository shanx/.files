cd ~/.dotfiles
# Auto add submodules
git submodule init
git submodule update

# Install dotfiles
sudo pip install dotfiles
ln -s ~/.dotfiles/dotfilesrc ~/.dotfilesrc
dotfiles --sync
