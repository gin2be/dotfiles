#!/usr/bin/env bash

ASDF_REPO=https://github.com/asdf-vm/asdf.git
ASDF_ROOT=$HOME/.asdf
ASDF_VERSION=v0.7.7

echo " installing asdf and some packages"
echo "  downloading asdf"
if [ -e "${ASDF_ROOT}" ]; then
  echo "   asdf already installed. Updating."
else
  git clone ${ASDF_REPO} ${ASDF_ROOT} --branch ${ASDF_VERSION}
fi

echo "  installing asdf"
source ${ASDF_ROOT}/asdf.sh

echo "  installing asdf plugins"
source ${DOTFILES}/scripts/middlewares/asdf/nodejs.sh
source ${DOTFILES}/scripts/middlewares/asdf/php.sh
source ${DOTFILES}/scripts/middlewares/asdf/go.sh

echo "  installing langs"
asdf install
