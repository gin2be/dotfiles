#!/usr/bin/env bash

PYENV_REPO=https://github.com/pyenv/pyenv.git
PYENV_ROOT=$HOME/.pyenv
PYENV_PLUGIN_ROOT=${PYENV_ROOT}/plugins

PYENV_PLUGINS=( https://github.com/yyuu/pyenv-virtualenv.git )

PYENV=${PYENV_ROOT}/bin/pyenv

PYTHON_INSTALL_VERSIONS=( "3.8.2" "2.7.17" )
PYTHON_GLOBAL_VERSION="3.8.2"

echo " installing pyenv"

echo "  downloading pyenv"
if [ -e "${PYENV_ROOT}" ]; then
  echo "   ${PYENV_ROOT} already exists. Skipping."
else
  git clone ${PYENV_REPO} ${PYENV_ROOT}
fi

echo "  downloading pyenv plugins"
for repo in ${PYENV_PLUGINS[@]}; do
  plugin=$(basename ${repo} ".git")
  repo_dir=${PYENV_PLUGIN_ROOT}/${plugin}
  echo "   -> ${plugin}"
  if [ -e "${repo_dir}" ]; then
    echo "    ${plugin} already exists. Skipping."
  else
    git clone ${repo} ${repo_dir}
  fi
done

echo "  installing python"
for version in ${PYTHON_INSTALL_VERSIONS[@]}; do
  echo "   -> ${version}"
  if [ -e "${PYENV_ROOT}/versions/${version}" ]; then
    echo "    ${version} is already installed. Skipping."
  else
    ${PYENV} install ${version}
  fi
done

echo "  set global -> ${PYTHON_GLOBAL_VERSION}"
${PYENV} global ${PYTHON_GLOBAL_VERSION}
