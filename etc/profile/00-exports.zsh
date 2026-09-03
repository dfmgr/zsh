#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Thursday, Mar 25, 2021 16:32 EDT
# @@File             :  00-exports.zsh
# @@Description      :  Core zsh/oh-my-zsh path and history exports
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
export ZSH="$HOME/.local/share/zsh/plugins/oh-my-zsh"
export ZSH_CUSTOM="$HOME/.local/share/zsh/plugins/oh-my-zsh/custom"
export ZSH_CACHEDIR="$HOME/.cache/oh-my-zsh"
export ZPLUG_HOME="$HOME/.local/share/zsh/zplug"
export ZSNAP_HOME="$HOME/.local/share/zsh/zsnap"
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$HOME/.cache/zhistory"
export SAVEHIST=5000
export HISTSIZE=2000
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
