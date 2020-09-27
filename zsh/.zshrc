# theoyrus zsh configuration

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b 
"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Aliases
alias history='fc -il 1' # https://github.com/ohmyzsh/ohmyzsh/issues/3466#issuecomment-118077852
alias lsl='ls -lah'
alias reload='source $HOME/.zshrc'

# Homebrew
HOMEBREW_NO_AUTO_UPDATE=1 # dont auto update pls

# dotfiles path
export DOT=$HOME/dotfiles

# Stow (dotfiles tools)
# run the stow command for the passed in directory ($2) in location $1
stowit() {
    usr=$1
    app=$2
    # -v verbose
    # -R recursive
    # -t target
    stow -v -R -t ${usr} ${app}
}

# NODE JS Environments
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" #--no-use # This loads nvm (--no-use for postpone using nvm, it's about performance)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java Environments
export JAVA_HOME='/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home/'

# Android Environments
export ANDROID_HOME=/Users/$USER/Android/sdk
export ANDROID_SDK_ROOT=/Users/$USER/Android/sdk
export ANDROID_AVD_HOME=/Users/$USER/.android/avd

export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH

# gradle
export GRADLE_HOME=/Users/$USER/Android/gradle/gradle-6.6.1/bin
export PATH=$PATH:$GRADLE_HOME

# Dart
export PATH="$PATH:$HOME/flutter/bin/cache/dart-sdk/bin"

# Flutter
export PATH="$PATH:$HOME/flutter/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/theoyrus/.sdkman"
[[ -s "/Users/theoyrus/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/theoyrus/.sdkman/bin/sdkman-init.sh"
