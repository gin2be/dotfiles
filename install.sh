#!/usr/bin/env bash

set -e

function task_spinner() {
  local spin=$1; shift
  local message=$@
  echo -en "  $spin  \033[01m$message\033[00m" "\r"
}

function subtask_spinner() {
  local spin=$1; shift
  local message=$@
  echo -en "   $spin  \033[01m$message\033[00m" "\r"
}

function task_failure() {
  echo -e "  \033[31m✗\033[00m  \033[01m$@\033[00m"
}

function task_success() {
  echo -e "  \033[32m✔\033[00m  \033[01m$@\033[00m"
}

function spinner() {
  local func=$1; shift
  local message=$@
  local chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
  local delay=0.1

  local result="$(eval "($func) &")"
  local pid=$!

  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    for (( i=0; i<${#chars}; i++ )); do
      task_spinner "${chars:$i:1}" "$message"
      sleep $delay
    done
  done
  if wait $pid; then
    task_success "$message"
  else
    task_failure "$message"
  fi
  echo $result
}

function longprocess() {
  sleep 2
  sleep 3
  sleep 4
  echo 'Hello'
}

spinner "longprocess" "wait 1 seconds"

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
