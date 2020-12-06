export ZSH="/Users/christopherboyer/.oh-my-zsh"
ZSH_THEME="pygmalion"
plugins=(git)

source $ZSH/oh-my-zsh.sh
unsetopt nomatch

export TERM="xterm-256color"

sh ./.zsh-local.sh


