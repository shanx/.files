pushd ~/.files
# Auto add submodules
git submodule init
git submodule update

pushd external/hg-prompt/
git submodule update --init
popd

# Install .files
virtualenv ~/.files/.venv --no-site-packages
~/.files/.venv/bin/pip install dotfiles
ln -sf ~/.files/dotfilesrc ~/.dotfilesrc
~/.files/bin/dotfiles --sync

# Install vundle bundles
vim -c "BundleInstall"

# Create last_updated file
touch ~/.files/.last_updated
