# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export PATH=${PATH}:/Library/PostgreSQL/9.0/bin
#export REBEL_HOME=~/bin/jrebel

export RUBYOPT=rubygems
export PATH=$PATH:/users/antonyh/bin

export M2_HOME="/Users/antonyh/bin/apache-maven-3.0.5"
export PATH=${PATH}:${M2_HOME}/bin
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0_31-b04-415.jdk/Contents/Home
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)


export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

#source ~/.bashrc

alias crx-mvn="mvn clean install crx:install"


#keychain

eval `ssh-agent`
keychain
ssh-add ~/.ssh/keys/*

