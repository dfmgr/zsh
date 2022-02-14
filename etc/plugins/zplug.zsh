#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# zplug install
ZPLUG_ENABLED="${ZPLUG_ENABLED:-false}"
ZPLUG_HOME="${ZPLUG_HOME:-$HOME/.local/share/zsh/zplug}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[[ "$ZPLUG_ENABLED" = "true" ]] || return 0
if [[ ! -d "$ZPLUG_HOME/.git" ]]; then
  git clone "https://github.com/zplug/zplug" "$ZPLUG_HOME" &>/dev/null
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Load init script
if [[ -f "$ZPLUG_HOME/init.zsh" ]]; then
  source "$ZPLUG_HOME/init.zsh"
fi
