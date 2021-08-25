#!/usr/bin/env/zsh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Load init script
source "$HOME/.local/share/zsh/zsh-snap/install.zsh"
source "$HOME/.local/share/zsh/zplug/init.zsh"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Define plugins
znap source marlonrichert/zcolors
znap eval zcolors "zcolors ${(q)LS_COLORS}"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Run last
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo
        zplug install
    fi
fi
