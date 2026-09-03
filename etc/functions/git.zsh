#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Sunday, Mar 21, 2021 20:43 EDT
# @@File             :  git.zsh
# @@Description      :  Functions for git
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
get_git_repository_details() {
  local branchName=""
  local tmp=""
  ! git rev-parse &>/dev/null && return
  [ "$(git rev-parse --is-inside-git-dir)" == "true" ] && return
  if ! git diff --quiet --ignore-submodules --cached; then tmp="$tmp+"; fi
  if ! git diff-files --quiet --ignore-submodules --; then tmp="$tmp!"; fi
  if [ -n "$(git ls-files --others --exclude-standard)" ]; then tmp="$tmp?"; fi
  if git rev-parse --verify refs/stash &>/dev/null; then tmp="$tmp$"; fi
  [ -n "$tmp" ] && tmp=" [$tmp]"
  branchName="$(printf "%s" "$(git rev-parse --abbrev-ref HEAD 2>/dev/null ||
    git rev-parse --short HEAD 2>/dev/null ||
    printf " (unknown)")" | tr -d "\n")"
  printf "%s" "$1$branchName$tmp"
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
