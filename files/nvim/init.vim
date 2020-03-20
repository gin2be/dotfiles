let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

if !&compatible
  set nocompatible
endif

set runtimepath+=$DOTFILES/files/nvim
runtime! conf/*.vim
runtime! conf/commands/*.vim
