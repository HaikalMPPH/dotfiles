#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

## Custom alias
alias bri='sudo brightnessctl set'
alias limbat='sudo rmmod $HOME/Programs/acer-wmi-battery/acer-wmi-battery.ko; sudo insmod $HOME/Programs/acer-wmi-battery/acer-wmi-battery.ko enable_health_mode=1'
alias limbat-disable='sudo rmmod $HOME/Programs/acer-wmi-battery/acer-wmi-battery.ko; sudo insmod $HOME/Programs/acer-wmi-battery/acer-wmi-battery.ko enable_health_mode=0'
alias clr-trash='rm -r .local/share/Trash/files/*'
alias readmode='redshift -O 3000'
alias readmode-disable='redshift -x'
# Reminder
alias remind="~/remind"

## Custom Function
# make acer-wmi-battery
limbat-make() {
  cd $HOME/Programs/acer-wmi-battery/;
  make;
  cd -;
}
limbat-make-clean() {
  cd $HOME/Programs/acer-wmi-battery/;
  make clean;
  cd -;
}
stats() {
  stat=$"Date: $(date)\n"
  stat="${stat}Batery: $(cat /sys/class/power_supply/BAT1/capacity)%\n"
  echo -e $stat
}

# bash prompt
#PS1="[\[\e[35m\]\$(cat /sys/class/power_supply/BAT1/capacity)%\[\e[m\]][\[\e[36m\]\A\[\e[m\]][\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]][\[\e[36m\]\w\[\e[m\]]\[\e[32m\]\n>\[\e[m\] \[\e[32m\]\\$\[\e[m\] "

PS1="\n\w > \$ "

## CUSTOM ENV VARIABLE ##
# Android Studio
export PATH=$PATH:$HOME/Programs/android-studio/bin
# Godot
export PATH=$PATH:$HOME/Programs/Godot
# Eclipse java
export PATH=$PATH:$HOME/Programs/eclipse/java-2023-06/eclipse
# home .local directory
export PATH=$PATH:$HOME/.local/bin
# default browser (using CLI)
export BROWSER=links

# custom directory variable
export tgs=$HOME/Documents/personal/tugas
export proj=$HOME/Documents/personal/projects
export notes=$HOME/Documents/personal/notes
export learn=$HOME/Documents/personal/learn-res
