#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Wednesday, Oct 27, 2021 22:40 UTC
# @@File             :  plugins.zsh
# @@Description      :  Loads all plugin files from the zsh plugins directory
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
# Load all plugin files from .config/zsh/plugins directory
setopt null_glob
for pluginfile in "$HOME/.config/zsh/plugins"/*.zsh(N); do
  [[ -f "$pluginfile" ]] && source "$pluginfile" 2>/dev/null
done
unsetopt null_glob
unset pluginfile
