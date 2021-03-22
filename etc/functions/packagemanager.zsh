#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202103212059-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.com
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
if [ -f "$(command -v brew)" ]; then brew() { brew "$@"; }; fi
if [ -f "$(command -v apt)" ]; then apt() { sudo -H apt "$@"; }; fi
if [ -f "$(command -v dnf)" ]; then dnf() { sudo -H dnf "$@"; }; fi
if [ -f "$(command -v yum)" ]; then yum() { sudo -H yum "$@"; }; fi
if [ -f "$(command -v pamac)" ]; then pamac() { sudo -H pamac "$@"; }; fi
if [ -f "$(command -v pacman)" ]; then pacman() { sudo -H pacman "$@"; }; fi
if [ -f "$(command -v apt-get)" ]; then apt-get() { sudo -H apt-get "$@"; }; fi
if [ -f "$(command -v xbps-install)" ]; then xbps-install() { sudo -H xbps-install "$@"; }; fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
