#!/usr/bin/env zsh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# @Author      : Jason
# @Contact     : casjaysdev@casjay.net
# @File        : stty.zsh
# @Created     : Mon, Dec 31, 2019, 00:00 EST
# @License     : WTFPL
# @Copyright   : Copyright (c) CasjaysDev
# @Description : stty, disable terminal lock
#
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

_set_stty() {
  tty -s && stty stop undef
  tty -s && stty start undef
  [[ "$OSTYPE" = darwin* ]] && tty -s && stty discard undef
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
