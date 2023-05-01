#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# oh-my-zsh install
export UPDATE_ZSH_DAYS=30
export ZSH="${ZSH:-$HOME/.local/share/zsh/plugins/oh-my-zsh}"
export ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.local/share/zsh/plugins/oh-my-zsh/custom}"
export ZSH_CACHEDIR="${ZSH_CACHEDIR:-$HOME/.cache/oh-my-zsh}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ ! -d "$ZSH/.git" ]]; then
  echo "Installing oh-my-sh plugin and themes"
  rm -Rf "$ZSH"
  git clone -q "https://github.com/robbyrussell/oh-my-zsh.git" "$ZSH"
fi
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/.git" ]]; then
  git clone -q "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi
if [[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k/.git" ]]; then
  git clone -q "https://github.com/romkatv/powerlevel10k.git" "$ZSH_CUSTOM/themes/powerlevel10k"
fi
if [[ ! -d "$ZSH_CUSTOM/themes/powerlevel9k/.git" ]]; then
  git clone -q "https://github.com/bhilburn/powerlevel9k.git" "$ZSH_CUSTOM/themes/powerlevel9k"
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# oh-my-zsh cache dir
if [[ ! -d "$ZSH_CACHEDIR" ]]; then
  mkdir -p "$ZSH_CACHEDIR" 2>/dev/null
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# what OS?
case "$(uname)" in
Darwin)
  readonly PS_SYMBOL=" 🍎 "
  ;;
Linux)
  readonly PS_SYMBOL=" 🐧 "
  ;;
msys* | Win* | MINGW* | CYGWIN*)
  readonly PS_SYMBOL=" 😥 "
  ;;
*)
  readonly PS_SYMBOL=" 👽 "
  ;;
esac
# load oh-my-zsh
if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh" 2>/dev/null
fi
# load theme powerlevel9k
# if [[ -f "$ZSH_CUSTOM/themes/powerlevel9k/powerlevel9k.zsh-theme" ]]; then
#   ZSH_THEME="powerlevel9k/powerlevel9k"
#   source "$ZSH_CUSTOM/themes/powerlevel9k/powerlevel9k.zsh-theme" 2>/dev/null
#   source "$HOME/.config/zsh/themes/powerlevel-09k.zsh"
# fi
# load theme powerlevel10k
if [[ -f "$ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme" ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
  source "$ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme" 2>/dev/null
fi
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/themes/powerlevel-10k.zsh.
[[ ! -f ~/.config/zsh/themes/powerlevel-10k.zsh ]] || source ~/.config/zsh/themes/powerlevel-10k.zsh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Load plugins
plugins=(
  asdf
  git
  vscode
  vundle
  command-not-found
  pyenv
  thefuck
  tmux
  vundle
  zsh_reload
  zsh-syntax-highlighting
)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
