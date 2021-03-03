#!/usr/bin/env zsh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# @Author      : Jason
# @Contact     : casjaysdev@casjay.net
# @File        : file_header.zsh
# @Created     : Mon, Dec 31, 2019, 00:00 EST
# @License     : WTFPL
# @Copyright   : Copyright (c) CasjaysDev
# @Description : get header information for my scripts
# @Requires    :
#
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

file_header() {
  grep "# @.*: " "$1" >/tmp/file_header
  printf_green "$(cat /tmp/file_header)"
  rm -Rf /tmp/file_header
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
