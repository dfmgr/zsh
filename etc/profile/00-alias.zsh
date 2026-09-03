#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Thursday, Mar 25, 2021 16:38 EDT
# @@File             :  00-alias.zsh
# @@Description      :  Loads OS-specific and shared shell aliases
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
case "$OSTYPE" in
cygwin* | msys* | mingw*)
  if [[ -f "$HOME/.config/misc/shell/aliases/00-default.win" ]]; then
    source "$HOME/.config/misc/shell/aliases/00-default.win"
  elif [[ -f "$HOME/.config/zsh/aliases/00-default.win" ]]; then
    source "$HOME/.config/zsh/aliases/00-default.win"
  fi
  ;;
darwin*)
  if [[ -f "$HOME/.config/misc/shell/aliases/00-default.mac" ]]; then
    source "$HOME/.config/misc/shell/aliases/00-default.mac"
  elif [[ -f "$HOME/.config/zsh/aliases/00-default.mac" ]]; then
    source "$HOME/.config/zsh/aliases/00-default.mac"
  fi
  ;;
linux*)
  if [[ -f "$HOME/.config/misc/shell/aliases/00-default.lin" ]]; then
    source "$HOME/.config/misc/shell/aliases/00-default.lin"
  elif [[ -f "$HOME/.config/zsh/aliases/00-default.lin" ]]; then
    source "$HOME/.config/zsh/aliases/00-default.lin"
  fi
  ;;
*)
  echo -e "\t\tUnknown OS or OS not supported"
  ;;
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
esac
if [[ -f "$HOME/.config/misc/shell/aliases/00-aliases.sh" ]]; then
  source "$HOME/.config/misc/shell/aliases/00-aliases.sh"
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
