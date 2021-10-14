# theoyrus oh-my-zsh customization

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

alias netmanres='sudo service network-manager restart'
alias restartde='xfce4-panel -r && xfwm4 --replace'
alias cleanswap='sudo swapoff -a && sudo swapon -a'
alias chmodalld='find . -type d -exec chmod 755 -- {} +'
alias chmodallf='find . -type f -exec chmod 644 -- {} +'
alias lsl='ls -lah'
alias cleands='find . -name '.DS_Store' -type f -delete'
alias fmem='sudo ps_mem'
alias openport='sudo lsof -i -P -n | grep LISTEN'

# alias for docker management
alias dock='docker '
alias dcstart='docker-compose up -d' # start as daemon
alias dcstop='docker-compose stop; docker-compose rm -f' #stop and remove container created by docker-compose
alias dcup='docker-compose up -d' # start as daemon (another alias)
alias dcdown='docker-compose down' #stop and remove container created by docker-compose (simple stop)
alias dcrestart='dcdown && dcup'
alias dps='docker ps' #show docker process
alias dcps='docker-compose ps' #show docker-compose process
alias chwp='xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorLVDS-1/workspace0/last-image -s $1'

alias gxadd='git update-index --assume-unchanged ' # add git file excluded locally 
alias gxrem='git update-index --no-assume-unchanged ' # remove git file excluded locally
alias gxls='git ls-files -v | grep ^h' # show git file excluded locally 
alias gxcom='git reset --soft HEAD~1' # cancel latest commit

# custom
mkcd() { mkdir -p "$@" && cd "$@"; }

dcupf() { docker-compose -f "$@" up -d; }
dcdownf() { docker-compose -f "$@" down; }
dcrestartf() { docker-compose -f "$@" down; docker-compose -f "$@" up -d; }

# lvim
lvim(){
    tput smkx
    command lvim $@
}

#git
gstashstag() { git stash push -m "$@" -- $(git diff --staged --name-only); }

#NPM DAN KRONI-KRONINYA
export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"
#GLOBAL NODE_MODULES bin
export PATH="$HOME/.node_modules_global/bin:$PATH"

# SET JAVA ENVIRONTMENT
#JAVA_HOME=/opt/java/jdk1.8.0_111
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export JAVA_HOME
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
export PATH

#ANDROID_HOME set path
export ANDROID_HOME=$HOME/Android/Sdk/
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin

#Gradle set path
export PATH=$PATH:$HOME/Android/Gradle/bin

# Flutter 
export PATH="$PATH:$HOME/flutter/bin"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# ----- fix vscode error on launch `Unable to resolve your shell environment in a reasonable time. Please review your shell configuration.`
# https://stackoverflow.com/a/66513254
function load-nvm {
  export HOME_HDD='/DATA/diginet-35'
  export NVM_DIR="$HOME_HDD/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
}

# nvm
if [[ "x${TERM_PROGRAM}" = "xvscode" ]]; then 
  echo 'in vscode, nvm not work; use `load-nvm`';
else 
  load-nvm
fi

# -----

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#pyenv shell system # default use python system

# Python bin, Created by `userpath` on 2020-11-15 12:09:07
export PATH="$PATH:$HOME/.local/bin"

# pipenv
# enable autocompletion
# eval "$(pipenv --completion)"
# enable auto create if not exists .venv dir inside project dir
export PIPENV_VENV_IN_PROJECT=1

#composer bin path
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# export GOPATH="$HOME/go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
