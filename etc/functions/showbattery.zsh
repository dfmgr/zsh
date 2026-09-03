#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202103212102-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.pro
# @License       : WTFPL
# @ReadME        : showbattery.zsh
# @Copyright     : Copyright: (c) 2021 Jason Hempstead, CasjaysDev
# @Created       : Sunday, Mar 21, 2021 21:02 EDT
# @File          : showbattery.zsh
# @Description   : Shows battery status
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
showbattery() {
  local dir=/sys/class/power_supply/BAT0/
  local full
  if [[ -e "$dir"/charge_now ]]; then
    full=$(<"$dir"/charge_full)
    [[ "$full" -gt 0 ]] && echo "$(<"$dir"/status) $(($(<"$dir"/charge_now) * 100 / full))%"
  elif [[ -e "$dir"/energy_now ]]; then
    full=$(<"$dir"/energy_full)
    [[ "$full" -gt 0 ]] && echo "$(<"$dir"/status) $(($(<"$dir"/energy_now) * 100 / full))%"
  fi
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# shows battery full statistics
showbatteryfull() {
  local bat
  bat="$(upower -e | grep BAT | head -n1)"
  upower -i "$bat"
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
