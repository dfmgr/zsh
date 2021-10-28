#!/usr/bin/env zsh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# zplug install
ZPLUG_HOME="${ZPLUG_HOME:-$HOME/.local/share/zsh/zplug}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ ! -d "$ZPLUG_HOME/.git" ]]; then
  git clone "https://github.com/zplug/zplug" "$ZPLUG_HOME" &>/dev/null
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Load init script
if [[ -f "$ZPLUG_HOME/init.zsh" ]]; then
  source "$ZPLUG_HOME/init.zsh"
fi
