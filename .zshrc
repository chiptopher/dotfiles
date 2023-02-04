export ZSH="/Users/christopherboyer/.oh-my-zsh"
ZSH_THEME="crunch"
plugins=(git)

source $ZSH/oh-my-zsh.sh
unsetopt nomatch

export TERM="xterm-256color"

alias gt=git status

alias f="fzf --height 40% --layout reverse --info inline --border --preview 'bat --style=numbers --color=always --line-range :500 {}'  --bind Ctrl-k:preview-up,Ctrl-j:preview-down"

export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PATH=/Users/christopherboyer/.gem/ruby/2.6.0/bin:$PATH


source ~/.zsh-local.sh


alias resize="tmux resize-pane -R 100"

[ -f "/Users/christopherboyer/.ghcup/env" ] && source "/Users/christopherboyer/.ghcup/env" # ghcup-env
