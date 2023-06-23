#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1="\e[1;31m[\@]\e[m\e[1;36m[\u@\h \w] \e[m 
\e[1;32m> \$\e[m "

## CUSTOM ENV VARIABLE ##
# Android Studio
export PATH=$PATH:$HOME/Programs/android-studio/bin
# steam Proton
export PATH=$PATH:$HOME/.steam/steam/steamapps/common/Proton\ 8.0
# Android SDK
export PATH=$PATH:$HOME/.Android/Sdk
