#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Load all plugin files from .config/zsh/plugins directory
setopt null_glob
for pluginfile in "$HOME/.config/zsh/plugins"/*.zsh(N); do
  [[ -f "$pluginfile" ]] && source "$pluginfile" 2>/dev/null
done
unsetopt null_glob
unset pluginfile
