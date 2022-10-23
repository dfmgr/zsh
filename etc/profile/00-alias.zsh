#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202103251632-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.com
# @License       : LICENSE.md
# @ReadME        : README.md
# @Copyright     : Copyright: (c) 2021 Jason Hempstead, CasjaysDev
# @Created       : Thursday, Mar 25, 2021 16:38 EDT
# @File          : 00-alias.zsh
# @Description   :
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
case "$(uname -s)" in
CYGWIN* | MINGW32* | MSYS* | MINGW*)
  if [ -f "$HOME/.config/misc/shell/aliases/00-default.win" ]; then
    source "$HOME/.config/misc/shell/aliases/00-default.win"
  elif [ -f "$HOME/.config/zsh/aliases/00-default.win" ]; then
    source "$HOME/.config/zsh/aliases/00-default.win"
  fi
  ;;
Darwin)
  if [ -f "$HOME/.config/misc/shell/aliases/00-default.mac" ]; then
    source "$HOME/.config/misc/shell/aliases/00-default.mac"
  elif [ -f "$HOME/.config/zsh/aliases/00-default.mac" ]; then
    source "$HOME/.config/zsh/aliases/00-default.mac"
  fi
  ;;
Linux)
  if [ -f "$HOME/.config/misc/shell/aliases/00-default.lin" ]; then
    source "$HOME/.config/misc/shell/aliases/00-default.lin"
  elif [ -f "$HOME/.config/zsh/aliases/00-default.lin" ]; then
    source "$HOME/.config/zsh/aliases/00-default.lin"
  fi
  ;;
*)
  echo -e "\t\tUnknown OS or OS not supported"
  ;;
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
esac
if [ -f "$HOME/.config/misc/shell/aliases/00-aliases.sh" ]; then
  source "$HOME/.config/misc/shell/aliases/00-aliases.sh"
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
