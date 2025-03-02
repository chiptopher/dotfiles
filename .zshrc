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

export PATH=/opt/nordic/ncs/v2.4.0/modules/lib/matter/zap_location/zap-mac/zap.app/Contents/MacOS:$PATH
export PATH=/opt/nordic/ncs/v2.4.0/modules/lib/matter/zap_location/zap-mac:$PATH
export PICO_SDK_PATH="$HOME/pico/pico-sdk"


source ~/.zsh-local.sh


alias resize="tmux resize-pane -R 100"

[ -f "/Users/christopherboyer/.ghcup/env" ] && source "/Users/christopherboyer/.ghcup/env" # ghcup-env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias vim_clean="find . -type f -name \"*.sw[klmnop]\" -delete"
