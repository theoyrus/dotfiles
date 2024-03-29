# theoyrus oh-my-zsh customization

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
HIST_STAMPS="%d/%m/%y %T"

alias netmanres='sudo service network-manager restart'
alias restartde='xfce4-panel -r && xfwm4 --replace'
alias cleanswap='sudo swapoff -a && sudo swapon -a'
alias chmodalld='find . -type d -exec chmod 755 -- {} +'
alias chmodallf='find . -type f -exec chmod 644 -- {} +'
alias lsl='ls -lah'
alias cleands='find . -name '.DS_Store' -type f -delete'
alias fmem='sudo ps_mem'
alias openport='sudo lsof -i -P -n | grep LISTEN'
alias pipsh='pipenv shell'

# alias for docker management
alias dock='docker '
alias dcstart='docker-compose up -d' # start as daemon
alias dcstop='docker-compose stop; docker-compose rm -f' #stop and remove container created by docker-compose
alias dcup='docker-compose up -d' # start as daemon (another alias)
alias dcdown='docker-compose down' #stop and remove container created by docker-compose (simple stop)
alias dcrestart='dcdown && dcup'
alias dps='docker ps' #show docker process
alias dcps='docker-compose ps' #show docker-compose process
alias dccleanunusedimgs='docker rmi $(docker images -f dangling=true -q)'

# alias for kubectl
# alias kubectl='minikube kubectl --'

alias chwp='xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorLVDS-1/workspace0/last-image -s $1'

alias gxadd='git update-index --assume-unchanged ' # add git file excluded locally 
alias gxrem='git update-index --no-assume-unchanged ' # remove git file excluded locally
alias gxls='git ls-files -v | grep ^h' # show git file excluded locally 
alias gxcom='git reset --soft HEAD~1' # cancel latest commit

# custom
alias history='omz_history -t '\''%d/%m/%y %T'\'

mkcd() { mkdir -p "$@" && cd "$@"; }

CP() {
    mkdir -p $(dirname "$2") && cp "$1" "$2"
}

dcupf() { docker-compose -f "$@" up -d; }
dcdownf() { docker-compose -f "$@" down; }
dcrestartf() { docker-compose -f "$@" down; docker-compose -f "$@" up -d; }
dcimgsize() { docker manifest inspect -v "$1" | jq -c 'if type == "array" then .[] else . end' |  jq -r '[ ( .Descriptor.platform | [ .os, .architecture, .variant, ."os.version" ] | del(..|nulls) | join("/") ), ( [ .SchemaV2Manifest.layers[].size ] | add ) ] | join(" ")' | numfmt --to iec --format '%.2f' --field 2 | column -t ; }
dcimgsz() { docker save "$1" | gzip > /tmp/"$1".tgz && du -sh /tmp/"$1".tgz && rm /tmp/"$1".tgz }

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

# NVM - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# SET JAVA ENVIRONTMENT
#JAVA_HOME=/opt/java/jdk1.8.0_111
# JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
# export JAVA_HOME
# PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
# export PATH

# chrome executable
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

#ANDROID_HOME set path
export ANDROID_HOME=$HOME/Android/Sdk/
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin

#Gradle set path
# export PATH=$PATH:$HOME/Android/Gradle/bin

# dart version manager
if [[ -f ~/.dvm/scripts/dvm ]]; then
  . ~/.dvm/scripts/dvm
fi

# Flutter 
# export PATH="$PATH:$HOME/flutter/bin"
# Flutter Version Manager
export PATH="$PATH":"$HOME/.pub-cache/bin"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

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

# GVM (Golang Version Manager)
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export PATH="/home/theoyrus/.gvm/go/bin:$PATH"

# thin line cursor
#echo '\e[5 q'

# phpenv
# export PHPENV_ROOT="/home/theoyrus/.phpenv"
# if [ -d "${PHPENV_ROOT}" ]; then
#   export PATH="${PHPENV_ROOT}/bin:${PATH}"
#   eval "$(phpenv init -)"
# fi

# phpbrew
# [[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Kubernetes tools autocompletion
# [[ $commands[kubectl] ]] && source <(kubectl completion zsh)
# [[ $commands[minikube] ]] && source <(minikube completion zsh)
#[[ $commands[helm]] && source <(helm completion zsh)
