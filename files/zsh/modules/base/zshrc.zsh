# Base settings
setopt hist_ignore_all_dups
setopt share_history
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*' group-name ''
export HISTFILE=$HOME/.zsh/.zsh_history
export HIST_STAMPS="yyyy-mm-dd"
export SAVEHIST=10000000
export HISTSIZE=$SAVEHIST
export TERM=xterm-256color
