# Customize to your needs...
export PATH="./.bin:./script:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# Add RVM to PATH for scripting
export PATH="$HOME/.rvm/bin:$PATH"
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="gnzh"
export CASE_SENSITIVE="true"
export DISABLE_AUTO_TITLE="true"

plugins=(git ruby gem vundle)

source $ZSH/oh-my-zsh.sh

# My rc file
. ~/.zsh/rc

[[ $TERM = "screen" ]] && rvm use default

