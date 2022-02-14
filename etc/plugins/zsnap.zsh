#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# zsnap install
ZNAP_ENABLED="${ZNAP_ENABLED:-false}"
ZSNAP_HOME="${ZSNAP_HOME:-$HOME/.local/share/zsh/zsnap}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[[ "$ZNAP_ENABLED" = "true" ]] || return 0
if [[ ! -d "$ZSNAP_HOME/.git" ]]; then
  git clone "https://github.com/marlonrichert/zsh-snap" "$ZSNAP_HOME" &>/dev/null
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Load init script
if [[ -f "$ZSNAP_HOME/install.zsh" ]]; then
  source "$ZSNAP_HOME/install.zsh"
fi
if [[ -f "$ZSNAP_HOME/znap.zsh" ]]; then
  source "$ZSNAP_HOME/znap.zsh"
fi
