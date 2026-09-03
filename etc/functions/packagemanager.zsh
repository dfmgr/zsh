#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202103212059-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.pro
# @License       : WTFPL
# @ReadME        : packagemanager.zsh
# @Copyright     : Copyright: (c) 2021 Jason Hempstead, CasjaysDev
# @Created       : Sunday, Mar 21, 2021 20:59 EDT
# @File          : packagemanager.zsh
# @Description   : Sets up the package managers
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if (( $+commands[apt] )); then apt() { sudo -H apt "$@"; }; fi
if (( $+commands[dnf] )); then dnf() { sudo -H dnf "$@"; }; fi
if (( $+commands[yum] )); then yum() { sudo -H yum "$@"; }; fi
if (( $+commands[pamac] )); then pamac() { sudo -H pamac "$@"; }; fi
if (( $+commands[pacman] )); then pacman() { sudo -H pacman "$@"; }; fi
if (( $+commands[apt-get] )); then apt-get() { sudo -H apt-get "$@"; }; fi
if (( $+commands[xbps-install] )); then xbps-install() { sudo -H xbps-install "$@"; }; fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
