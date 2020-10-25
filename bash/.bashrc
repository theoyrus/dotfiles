alias xampp='sudo /opt/lampp/manager-linux-x64.run'
alias netmanres='sudo service network-manager restart'
alias restartde='xfce4-panel -r && xfwm4 --replace'
alias cleanswap='sudo swapoff -a && sudo swapon -a'
alias pkexec='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY'
alias start_portainer='docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer'
alias chmodalld='find . -type d -exec chmod 755 -- {} +'
alias chmodallf='find . -type f -exec chmod 644 -- {} +'
alias swappiness5='sudo sysctl vm.swappiness=5'
alias swappiness10='sudo sysctl vm.swappiness=10'

# alias for docker management
alias dock='docker '
alias dcstart='docker-compose up -d' # start as daemon
alias dcstop='docker-compose stop; docker-compose rm -f' #stop and remove container created by docker-compose
alias dcup='docker-compose up -d' # start as daemon (another alias)
alias dcdown='docker-compose down' #stop and remove container created by docker-compose (simple stop)
alias dps='docker ps' #show docker process
alias dcps='docker-compose ps' #show docker-compose process
alias chwp='xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorLVDS-1/workspace0/last-image -s $1'

# custom
mkcd() { mkdir -p "$@" && cd "$@"; }


#NPM DAN KRONI-KRONINYA
export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"
#GLOBAL NODE_MODULES bin
export PATH="$HOME/.node_modules_global/bin:$PATH"


# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# colorize 
# color names for readibility
reset=$(tput sgr0)
bold=$(tput bold)
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
user_color="$bold$green"
[ "$UID" -eq 0 ] && { user_color="$bold$red"; }

export PS1="\[$reset\][\[$cyan\]\A\[$reset\]]\[$user_color\]\u\[$reset\]\[$yellow\]@\[$reset\]\[$magenta\]\h\
\[$white\]:\[$green\]\W\[$reset\] \[$white\]\
\\n$\[$reset\] "

#export PS1='\[\e[1;32m\]\u@\h\e[0;39m\]:\e[1;34m\]\w\e[0;39m\]$\[\e[0m\] '

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

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ---------------------
# Undocumented feature which sets the size to "unlimited".
# https://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="%Y-%m-%d %T: "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_full_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#PYTHON VIRTUALENV
#export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#export PROJECT_HOME=$HOME/virtualenv
#source /usr/local/bin/virtualenvwrapper.sh


#composer bin path
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

#geoserver HOME
export GEOSERVER_HOME="$HOME/geoserver"

#HOMEBREW on Linux
#test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
#test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
#test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
#echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
