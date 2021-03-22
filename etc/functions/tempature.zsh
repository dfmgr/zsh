#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202103212103-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.com
# @License       : WTFPL
# @ReadME        : tempature
# @Copyright     : Copyright: (c) 2021 Jason Hempstead, CasjaysDev
# @Created       : Sunday, Mar 21, 2021 21:03 EDT
# @File          : tempature.zsh
# @Description   : Convert tempature between C and F
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if ! cmd_exists celcius2f f2celcius; then
  celsius2f() {
    tf=$(echo "scale=2;((9/5) * $1) + 32" | bc)
    echo $tf
  }
  f2celcius() {
    tc=$(echo "scale=2;(5/9)*($1-32)" | bc)
    echo $tc
  }
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
