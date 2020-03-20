#!/usr/bin/env bash

set -e

DOTFILES_REPO="https://github.com/gin2be/dotfiles"

DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

function is_exists() {
  type "$1" 1>/dev/null 2>&1
}

#function sudo() {
#  if [ "${ROOT_PASSWORD}" = "" ]; then
#    echo
#    read -sp "Please input your password: " ROOT_PASSWORD
#    echo
#  fi
#  echo ${ROOT_PASSWORD} | $(which sudo) -S $@
#}

function download_dotfiles() {
  if [ ! -e $(dirname ${DOTFILES}) ]; then
    mkdir -p $(dirname ${DOTFILES})
  fi
  if is_exists git; then
    if [ -e ${DOTFILES} ]; then
      echo " ${DOTFILES} already exists. Updating."
      cd ${DOTFILES}; git pull --prune
    else
      git clone ${DOTFILES_REPO} ${DOTFILES}
    fi
  elif is_exists curl || is_exists wget; then
    if [ -e ${DOTFILES} ]; then
      echo " ${DOTFILES} already exists. Updating."
      rm -rf ${DOTFILES}
    fi
    archive=${DOTFILES_REPO}/archive/master.tar.gz
    if is_exists curl; then
      curl -L ${archive} | tar zxv
    elif is_exists wget; then
      wget -O- ${archive} | tar zxv
    fi
    mv dotfiles-master ${DOTFILES}
  else
    echo -e "\\ngit, curl or wget required."
    exit 1
  fi
}

echo "Installing dotfiles..."
echo "=============================="

echo -e "\\nDownloading dotfiles repository..."
download_dotfiles

source ${DOTFILES}/scripts/link.sh
source ${DOTFILES}/scripts/middlewares.sh

echo
