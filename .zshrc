# Customize to your needs...
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/gnzh/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="gnzh"
export CASE_SENSITIVE="true"
export DISABLE_AUTO_TITLE="true"

plugins=(git rails3 ruby cap gem thor vundle npm node knife nyan)

source $ZSH/oh-my-zsh.sh

# My rc file
. ~/.zsh/rc

[[ $TERM = "screen" ]] && rvm use default

#------------------------------
# add local bin dir to path
#------------------------------
export PATH="./.bin:$PATH"
export PATH="./script:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
