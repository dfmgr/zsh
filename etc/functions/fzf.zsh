#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202103212043-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.pro
# @License       : WTFPL
# @ReadME        : fzf.zsh --help
# @Copyright     : Copyright: (c) 2021 Jason Hempstead, CasjaysDev
# @Created       : Sunday, Mar 21, 2021 20:43 EDT
# @File          : fzf.zsh
# @Description   :
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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
