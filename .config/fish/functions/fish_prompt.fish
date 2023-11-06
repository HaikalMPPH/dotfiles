function fish_prompt
  set usrathost (echo (set_color cyan)'('(whoami)(set_color yellow)'@'(set_color red)(cat /etc/hostname)(set_color cyan)')')
  set dir       (echo (set_color blue)'('(pwd)')')
  set bat       (echo (set_color magenta)'('(cat /sys/class/power_supply/BAT1/capacity)'%'')')
  
  echo ''
  echo -e "$(set_color green)$(printf '\u250f\u2501')$bat$usrathost$dir"
  echo -e "$(set_color -o green)$(printf '\u2517\u2501\u2501') \$ "
end
