source ~/.zinit/bin/zinit.zsh

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

_sources ${DOTFILES}/files/zsh/modules/zinit/plugins/*.zsh(N-.)
