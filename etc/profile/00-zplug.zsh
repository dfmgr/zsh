#!/usr/bin/env/zsh

# Load init script
source "$HOME/.local/share/zsh/zplug/init.zsh"

# Define plugins
zplug "DhavalKapil/luaver"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "romkatv/powerlevel10k",   from:oh-my-zsh
zplug "bhilburn/powerlevel9k",   from:oh-my-zsh
zplug "robbyrussell/oh-my-zsh",   from:oh-my-zsh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Run last
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
