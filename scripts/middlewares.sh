#!/usr/bin/env bash


echo -e "\\nInstalling middlewares..."

source ${DOTFILES}/scripts/middlewares/apt.sh
source ${DOTFILES}/scripts/middlewares/zsh.sh
source ${DOTFILES}/scripts/middlewares/pyenv.sh
source ${DOTFILES}/scripts/middlewares/neovim.sh
source ${DOTFILES}/scripts/middlewares/asdf.sh
source ${DOTFILES}/scripts/middlewares/tools.sh
