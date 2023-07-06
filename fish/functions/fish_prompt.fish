function fish_prompt
  set usrnm (whoami)
  set dir   (pwd)
  set bat   (echo (cat /sys/class/power_supply/BAT1/capacity)%)
  
  echo -e "$(set_color green)$(printf '\u250f')$(set_color -o magenta)($bat)$(set_color -o cyan)($usrnm)$(set_color -o blue)($dir)"
  echo "$(set_color -o green)$(printf '\u2517\u2501\u2501') \$ "
end
