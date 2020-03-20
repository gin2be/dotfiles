#!/usr/bin/env bash

ZSH_DIR=$HOME/.zsh

ZINIT_REPO=https://github.com/zdharma/zinit.git
ZINIT_ROOT=$HOME/.zinit
ZINIT_BIN=${ZINIT_ROOT}/bin

echo " setup zsh"

echo "  creating zsh directory"
mkdir -p ${ZSH_DIR}

echo "  creating init script"
echo "DOTFILES=$DOTFILES" > ${ZSH_DIR}/init.zsh
echo "export DOTFILES" >> ${ZSH_DIR}/init.zsh

echo "  installing zsh plugin manager(zinit)"
mkdir -p ${ZINIT_ROOT}
if [ -e "${ZINIT_BIN}" ]; then
  echo "   zinit is already installed. Skipping."
else
  git clone ${ZINIT_REPO} ${ZINIT_ROOT}/bin
fi
