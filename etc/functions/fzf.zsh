#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Sunday, Mar 21, 2021 20:43 EDT
# @@File             :  fzf.zsh
# @@Description      :  fzf-powered open-file and cd helper functions
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
if (( $+commands[fd] )); then
  __fd() { fd "$@"; }
elif (( $+commands[fdfind] )); then
  __fd() { fdfind "$@"; }
fi
open_with_fzf() {
  __fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | while IFS= read -r file; do
    xdg-open "$file" 2>&-
  done
}
cd_with_fzf() {
  local dir
  dir="$(__fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
  [[ -n "$dir" ]] && cd "$dir"
}
