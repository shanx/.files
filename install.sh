pushd ~/.dotfiles
# Auto add submodules
git submodule init
git submodule update

pushd external/hg-prompt/
git submodule update --init
popd

# Install dotfiles
virtualenv ~/.dotfiles/.venv --no-site-packages
~/.dotfiles/.venv/bin/pip install dotfiles
ln -sf ~/.dotfiles/dotfilesrc ~/.dotfilesrc
~/.dotfiles/bin/dotfiles --sync

# Install vundle bundles
vim -c "BundleInstall"

# Create last_updated file
touch ~/.dotfiles/.last_updated
