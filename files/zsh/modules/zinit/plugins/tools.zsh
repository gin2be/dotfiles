zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zinit light BurntSushi/ripgrep
zinit ice from"gh-r" as"program" pick"*/ghq"
zinit load x-motemen/ghq
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

# envs
export FZF_DEFAULT_COMMAND='rg --files --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# functions
function fzf-select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

function fzf-src() {
  local selected_dir=$(ghq list -p | fzf --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N fzf-src
bindkey '^]' fzf-src
