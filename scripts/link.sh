#!/usr/bin/env bash

function install_dotfiles() {
  echo " creating symlinks"
  for file in $(find ${DOTFILES}/files -maxdepth 3 -type f -name \*.symlink); do
    from="${file}"
    to="$HOME/.$(basename ${file} ".symlink")"
    echo "  creating symlink ${from} -> ${to}"
    ln -sf "${from}" "${to}"
  done

  echo " creating nvim symlinks"
  mkdir -p $HOME/.config/nvim
  from="${DOTFILES}/files/nvim/init.vim"
  to="$HOME/.config/nvim/init.vim"
  echo "  creating symlink ${from} -> ${to}"
  ln -sf "${from}" "${to}"
  from="${DOTFILES}/files/nvim/coc-setting.json"
  to="$HOME/.config/nvim/coc-settings.json"
  echo "  creating symlink ${from} -> ${to}"
  ln -sf "${from}" "${to}"
  from="${DOTFILES}/files/nvim/package.json"
  to="$HOME/.config/coc/extensions/package.json"
  echo "  creating symlink ${from} -> ${to}"
  mkdir -p "$HOME/.config/coc/extensions"
  ln -sf "${from}" "${to}"
}

echo -e "\\nInstalling dotfiles..."
install_dotfiles
