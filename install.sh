#!/usr/bin/env bash

set -e

function log_failure() {
  echo -e "\033[31m✗\033[00m \033[01m$@\033[00m"
}

function log_success() {
  echo -e "\033[32m✔\033[00m \033[01m$@\033[00m"
}

function spinner() {
  local pid=$1; shift
  local message=$@
  local chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
  local delay=0.2

  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    for (( i=0; i<${#chars}; i++ )); do
      echo -en "${chars:$i:1} " "$message" "\r"
      sleep $delay
    done
  done
  if wait $pid; then
    log_success "$message"
  else
    log_failure "$message"
  fi
}

function longprocess() {
  sleep 1
}

(longprocess 1>/dev/null 2>&1) &
spinner $! wait 2 seconds

#DOTFILES_REPO="https://github.com/gin2be/dotfiles"
#
#DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

#function download_dotfiles() {
#  if [ ! -e $(dirname ${DOTFILES}) ]; then
#    mkdir -p $(dirname ${DOTFILES})
#  fi
#  if is_exists git; then
#    if [ -e ${DOTFILES} ]; then
#      echo " ${DOTFILES} already exists. Updating."
#      cd ${DOTFILES}; git pull --prune
#    else
#      git clone ${DOTFILES_REPO} ${DOTFILES}
#    fi
#  elif is_exists curl || is_exists wget; then
#    if [ -e ${DOTFILES} ]; then
#      echo " ${DOTFILES} already exists. Updating."
#      rm -rf ${DOTFILES}
#    fi
#    archive=${DOTFILES_REPO}/archive/master.tar.gz
#    if is_exists curl; then
#      curl -L ${archive} | tar zxv
#    elif is_exists wget; then
#      wget -O- ${archive} | tar zxv
#    fi
#    mv dotfiles-master ${DOTFILES}
#  else
#    echo -e "\\ngit, curl or wget required."
#    exit 1
#  fi
#}
#
#echo "Installing dotfiles..."
#echo "=============================="
#
#echo -e "\\nDownloading dotfiles repository..."
#download_dotfiles
#
#source ${DOTFILES}/scripts/link.sh
#source ${DOTFILES}/scripts/middlewares.sh
#
#echo
