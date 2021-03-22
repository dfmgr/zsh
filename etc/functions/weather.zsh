#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202103212107-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.com
# @License       : WTFPL
# @ReadME        : weather.zsh --help
# @Copyright     : Copyright: (c) 2021 Jason Hempstead, CasjaysDev
# @Created       : Sunday, Mar 21, 2021 21:07 EDT
# @File          : weather.zsh
# @Description   : Get weather info
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
wttrin() { curl -LSs http://wttr.in/$1?AFu$2 | grep -v "Location" && echo -e "\n\n"; }
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
wttrin2() { curl -LSs http://v2.wttr.in/$1?AFu$2 | grep -v "Location" && echo -e "\n\n"; }
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# shows weather in a city
wttrcity() { wttrfull "$@" | head -n 7; }
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
wttrfull() { wget -q -O - http://wttr.in/$1?AFu$2; }
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
