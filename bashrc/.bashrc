#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# bash prompt
export PS1="[\[\e[35m\]$(cat /sys/class/power_supply/BAT1/capacity)%\[\e[m\]][\[\e[36m\]\A\[\e[m\]][\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]][\[\e[36m\]\W\[\e[m\]]\[\e[32m\]\n>\[\e[m\] \[\e[32m\]\\$\[\e[m\] "

## CUSTOM ENV VARIABLE ##
# Android Studio
export PATH=$PATH:$HOME/Programs/android-studio/bin
