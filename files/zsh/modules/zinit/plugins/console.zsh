zinit ice wait'' atinit"zicompinit; zicdreplay"
zinit light zsh-users/zsh-syntax-highlighting

zinit ice atload"setupsolarized dircolors.ansi-light" lucid
zinit light joel-porquet/zsh-dircolors-solarized

PS1="READY >"
zinit ice wait'0' atinit"setopt promptsubst; autoload -Uz colors && colors"
zinit snippet OMZ::themes/robbyrussell.zsh-theme
