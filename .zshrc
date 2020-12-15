export ZSH="/Users/christopherboyer/.oh-my-zsh"
ZSH_THEME="pygmalion"
plugins=(git)

source $ZSH/oh-my-zsh.sh
unsetopt nomatch

export TERM="xterm-256color"

alias gt=git status

alias f="fzf --height 40% --layout reverse --info inline --border --preview 'bat --style=numbers --color=always --line-range :500 {}'  --bind Ctrl-k:preview-up,Ctrl-j:preview-down"

sh ~/.zsh-local.sh
