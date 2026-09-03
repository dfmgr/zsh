#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Friday, Aug 21, 2020 03:55 UTC
# @@File             :  90-profile.zsh
# @@Description      :  Removes the temporary .sudo marker file if present
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
# remove .sudo if exists
if [[ -f "$HOME/.sudo" ]]; then
  rm -f "$HOME/.sudo"
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
