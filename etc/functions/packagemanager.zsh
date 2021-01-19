#!/usr/bin/env bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# @Author      : Jason
# @Contact     : casjaysdev@casjay.net
# @File        : packagemanager.bash
# @Created     : Mon, Dec 31, 2019, 00:00 EST
# @License     : WTFPL
# @Copyright   : Copyright (c) CasjaysDev
# @Description : Sets up the package managers
#
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
