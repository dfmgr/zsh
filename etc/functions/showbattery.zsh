#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202103212102-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.com
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
  if [[ -e "$dir"/charge_now ]]; then
    echo "$(<"$dir"/status) $(($(<"$dir"/charge_now) * 100 / $(<"$dir"/charge_full)))%"
  elif [[ -e "$dir"/energy_now ]]; then
    echo "$(<"$dir"/status) $(($(<"$dir"/energy_now) * 100 / $(<"$dir"/energy_full)))%"
  fi
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# shows battery full statistics
showbatteryfull() { upower -i $(upower -e | grep BAT); }
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
