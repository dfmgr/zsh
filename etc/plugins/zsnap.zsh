#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Wednesday, Oct 27, 2021 22:40 UTC
# @@File             :  zsnap.zsh
# @@Description      :  Installs and loads the zsh-snap (znap) plugin manager
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
# zsnap install
ZNAP_ENABLED="${ZNAP_ENABLED:-false}"
ZSNAP_HOME="${ZSNAP_HOME:-$HOME/.local/share/zsh/zsnap}"
# - - - - - - - - - - - - - - - - - - - - - - - -
if [[ "$ZNAP_ENABLED" = "true" ]]; then
  if [[ ! -d "$ZSNAP_HOME/.git" ]]; then
    git clone "https://github.com/marlonrichert/zsh-snap" "$ZSNAP_HOME" &>/dev/null
  fi
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Load init script
  if [[ -f "$ZSNAP_HOME/install.zsh" ]]; then
    source "$ZSNAP_HOME/install.zsh"
  fi
  if [[ -f "$ZSNAP_HOME/znap.zsh" ]]; then
    source "$ZSNAP_HOME/znap.zsh"
  fi
fi
