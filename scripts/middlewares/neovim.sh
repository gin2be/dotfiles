#!/usr/bin/env bash

VIM_PLUG_FILE=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
VIM_AUTOLOAD_DIR=$HOME/.local/share/nvim/site/autoload

echo " setup neovim"

echo "  installing neovim plugin manager(vim-plug)"
echo "   downloading vim-plug"
curl -fLo ${VIM_AUTOLOAD_DIR}/plug.vim --create-dirs ${VIM_PLUG_FILE}

echo "  creating nvim symlinks"
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60

echo "  installing python for neovim"
echo "   2.7.17 -> neovim2"
$HOME/.pyenv/bin/pyenv virtualenv -f 2.7.17 neovim2
$HOME/.pyenv/versions/neovim2/bin/pip install neovim
echo "   3.8.2 -> neovim3"
$HOME/.pyenv/bin/pyenv virtualenv -f 3.8.2 neovim3
$HOME/.pyenv/versions/neovim3/bin/pip install neovim
