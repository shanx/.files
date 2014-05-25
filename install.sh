pushd ~/.files
# Auto add submodules
git submodule init
git submodule update

pushd external/hg-prompt/
git submodule update --init
popd

# Install .files by manually symlinking files 
pushd ~
ln -si .files/buildout .buildout
ln -si .files/config .config
ln -si .files/dir_colors .dir_colors
ln -si .files/gitconfig .gitconfig
ln -si .files/gitignore_global .gitignore_global
ln -si .files/hgignore_global .hgignore_global
ln -si .files/hgrc .hgrc
ln -si .files/hushlogin .hushlogin
ln -si .files/inputrc .inputrc
ln -si .files/slate .slate
ln -si .files/tmux.conf .tmux.conf
ln -si .files/vim .vim
ln -si .files/vimrc .vimrc
ln -si .files/zshrc .zshrc
popd

# Install vundle bundles
vim -c "BundleInstall"

