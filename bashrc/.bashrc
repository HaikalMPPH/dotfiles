#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Custom alias
alias bri='sudo brightnessctl set'
alias limbat='sudo insmod $HOME/Programs/acer-wmi-battery/acer-wmi-battery.ko enable_health_mode=1'

# Custom Function
limbat-make() {
  cd $HOME/Programs/acer-wmi-battery/;
  make;
  cd -;
}

# bash prompt
PS1="[\[\e[35m\]\$(cat /sys/class/power_supply/BAT1/capacity)%\[\e[m\]][\[\e[36m\]\A\[\e[m\]][\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]][\[\e[36m\]\w\[\e[m\]]\[\e[32m\]\n>\[\e[m\] \[\e[32m\]\\$\[\e[m\] "

## CUSTOM ENV VARIABLE ##
# Android Studio
export PATH=$PATH:$HOME/Programs/android-studio/bin
# Godot
export PATH=$PATH:$HOME/Programs/Godot
# Eclipse java
export PATH=$PATH:$HOME/Programs/eclipse/java-2023-06/eclipse

# custom directory variable
export tgs=$HOME/Documents/Personal/Tugas
