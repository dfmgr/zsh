#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Sunday, Mar 21, 2021 21:02 EDT
# @@File             :  showbattery.zsh
# @@Description      :  Shows battery status
# @@Changelog        :  Standardized header block to the new @@ template
# @@TODO             :
# @@Other            :
# @@Resource         :
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
# shellcheck disable=all
# - - - - - - - - - - - - - - - - - - - - - - - -
VERSION="202609031423-git"
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
