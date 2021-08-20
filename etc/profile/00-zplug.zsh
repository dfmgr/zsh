#!/usr/bin/env/zsh

source "$HOME/.local/share/zsh/zplug/init.zsh"
zplug "DhavalKapil/luaver"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
