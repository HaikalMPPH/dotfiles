function fish_prompt
  set usrnm (set_color cyan; echo '[';  whoami; echo ']')
  set dir   (set_color blue; echo '[';  pwd; echo ']')
  set bat   (set_color magenta; echo '['; cat /sys/class/power_supply/BAT1/capacity; echo ']')

  echo $bat $usrnm $dir
  echo '> $ '
end
