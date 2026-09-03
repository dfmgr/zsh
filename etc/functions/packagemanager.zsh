#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Sunday, Mar 21, 2021 20:59 EDT
# @@File             :  packagemanager.zsh
# @@Description      :  Wraps package manager commands to run with sudo
# @@Changelog        :  Standardized header block to the new @@ template
# @@TODO             :
# @@Other            :
# @@Resource         :
# @@Terminal App     :  no
# @@sudo/root        :  yes
# @@Template         :  shell/zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
# shellcheck disable=all
# - - - - - - - - - - - - - - - - - - - - - - - -
VERSION="202609031423-git"
if (( $+commands[apt] )); then apt() { sudo -H apt "$@"; }; fi
if (( $+commands[dnf] )); then dnf() { sudo -H dnf "$@"; }; fi
if (( $+commands[yum] )); then yum() { sudo -H yum "$@"; }; fi
if (( $+commands[pamac] )); then pamac() { sudo -H pamac "$@"; }; fi
if (( $+commands[pacman] )); then pacman() { sudo -H pacman "$@"; }; fi
if (( $+commands[apt-get] )); then apt-get() { sudo -H apt-get "$@"; }; fi
if (( $+commands[xbps-install] )); then xbps-install() { sudo -H xbps-install "$@"; }; fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
