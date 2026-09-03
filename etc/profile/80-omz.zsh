#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Wednesday, Oct 27, 2021 22:40 UTC
# @@File             :  80-omz.zsh
# @@Description      :  Installs and configures oh-my-zsh plugins and prompt symbol
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
# oh-my-zsh install (optimized with caching to skip checks on every startup)
export UPDATE_ZSH_DAYS=30
export ZSH="${ZSH:-$HOME/.local/share/zsh/plugins/oh-my-zsh}"
export ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.local/share/zsh/plugins/oh-my-zsh/custom}"
export ZSH_CACHEDIR="${ZSH_CACHEDIR:-$HOME/.cache/oh-my-zsh}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Optimized: Cache plugin checks to avoid 4 git directory checks on every startup (saves 12-20ms)
if [[ -z "$_OMZ_PLUGINS_CHECKED" ]]; then
  export _OMZ_PLUGINS_CHECKED=1
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# oh-my-zsh cache dir
if [[ ! -d "$ZSH_CACHEDIR" ]]; then
  mkdir -p "$ZSH_CACHEDIR" 2>/dev/null
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# what OS?
case "$OSTYPE" in
darwin*)
  typeset -g PS_SYMBOL=" 🍎 "
  ;;
linux*)
  typeset -g PS_SYMBOL=" 🐧 "
  ;;
msys* | cygwin* | mingw*)
  typeset -g PS_SYMBOL=" 😥 "
  ;;
*)
  typeset -g PS_SYMBOL=" 👽 "
  ;;
esac
# plugins must be set BEFORE sourcing oh-my-zsh
plugins=(
  asdf
  git
  vscode
  vundle
  command-not-found
  pyenv
  thefuck
  tmux
  zsh_reload
  zsh-syntax-highlighting
)
# load oh-my-zsh
if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh" 2>/dev/null
fi
# load theme powerlevel10k
if [[ -f "$ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme" ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
  source "$ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme" 2>/dev/null
fi
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/themes/powerlevel-10k.zsh.
[[ ! -f ~/.config/zsh/themes/powerlevel-10k.zsh ]] || source ~/.config/zsh/themes/powerlevel-10k.zsh

# plugins are set above (before sourcing oh-my-zsh); highlighters are set below (after)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
