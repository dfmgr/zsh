#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Wednesday, Oct 27, 2021 22:40 UTC
# @@File             :  zplug.zsh
# @@Description      :  Installs and loads the zplug plugin manager
# @@Changelog        :  Added the new @@ template header (file had none)
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
# zplug install
ZPLUG_ENABLED="${ZPLUG_ENABLED:-false}"
ZPLUG_HOME="${ZPLUG_HOME:-$HOME/.local/share/zsh/zplug}"
# - - - - - - - - - - - - - - - - - - - - - - - -
if [[ "$ZPLUG_ENABLED" = "true" ]]; then
  if [[ ! -d "$ZPLUG_HOME/.git" ]]; then
    git clone "https://github.com/zplug/zplug" "$ZPLUG_HOME" &>/dev/null
  fi
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Load init script
  if [[ -f "$ZPLUG_HOME/init.zsh" ]]; then
    source "$ZPLUG_HOME/init.zsh"
  fi
fi
