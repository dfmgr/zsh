#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Sunday, Mar 21, 2021 20:35 EDT
# @@File             :  file_header.zsh
# @@Description      :  Get header information for my scripts
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
file_header() {
  if [[ -z "$1" ]]; then
    echo "file_header: missing file argument" >&2
    return 1
  fi
  printf '# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n'
  grep '^?*#.@.*  :' "$1" | grep -Ev 'GEN_SCRIPTS_*_' | head -n"${2:-12}"
  printf '# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n'
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
