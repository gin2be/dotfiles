#!/usr/bin/env bash

SOURCELINES=()
APT_PACKAGES=( git curl wget unzip tmux )

# zsh
APT_PACKAGES+=( zsh )

# pyenv
APT_PACKAGES+=( build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm )
APT_PACKAGES+=( libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl )

# neovim
SOURCELINES+=( "ppa:neovim-ppa/unstable" )
APT_PACKAGES+=( neovim xsel )

# nodejs
APT_PACKAGES+=( yarn )

# php
APT_PACKAGES+=( autoconf bison build-essential curl gettext libcurl4-openssl-dev libedit-dev libicu-dev )
APT_PACKAGES+=( libjpeg-dev libmysqlclient-dev libonig-dev libpng-dev libpq-dev libreadline-dev libsqlite3-dev )
APT_PACKAGES+=( libssl-dev libxml2-dev libzip-dev openssl pkg-config re2c zlib1g-dev )

# docker
APT_PACKAGES+=( docker-ce docker-ce-cli )

echo " installing apt packages"
echo "  adding ppa repositories"
for sourceline in ${SOURCELINES[@]}; do
  sudo add-apt-repository -y ${sourceline}
done

echo "  adding other repositories"
# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
docker_repos="deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
if [ "$(lsb_release -is)" = "LinuxMint" ]; then
  ubuntu_codename=$(cat /etc/apt/sources.list.d/official-package-repositories.list | grep ubuntu | head -n1 | cut -d' ' -f3)
  docker_repos="deb [arch=amd64] https://download.docker.com/linux/ubuntu ${ubuntu_codename} stable"
fi
sudo add-apt-repository "${docker_repos}"

echo "  updating apt packages"
sudo apt update

echo "  upgrading apt packages"
sudo apt upgrade -y

echo "  installing apt packages"
sudo apt install -y ${APT_PACKAGES[@]}
