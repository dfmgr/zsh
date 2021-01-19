#!/usr/bin/env zsh

if [[ ! -f "$HOME/.local/share/zsh/oh-my-zsh/oh-my-zsh.sh" ]]; then
  echo "Installing oh-my-sh plugin and themes"
  rm -Rf "$HOME/.local/share/zsh/oh-my-zsh"
  git clone -q https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.local/share/zsh/oh-my-zsh"
  git clone -q https://github.com/bhilburn/powerlevel9k.git "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel9k"
  git clone -q https://github.com/romkatv/powerlevel10k.git "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel10k"
  git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.local/share/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi

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
if [[ -f "$HOME/.local/share/zsh/oh-my-zsh/oh-my-zsh.sh" ]]; then
  source "$HOME/.local/share/zsh/oh-my-zsh/oh-my-zsh.sh" 2>/dev/null
fi

# load theme powerlevel9k
if [[ -f "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme" ]]; then
  source "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme" 2>/dev/null
  source "$HOME/.config/zsh/themes/powerlevel-09k.zsh"
  ZSH_THEME="powerlevel9k/powerlevel9k"
fi

# load theme powerlevel10k
#if [[ -f "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme" ]]; then
#    source "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme" 2>/dev/null
#    source "$HOME/.config/zsh/themes/powerlevel-10k.zsh"
#    ZSH_THEME="powerlevel10k/powerlevel10k"
#fi

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Load plugins
plugins=(
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

# oh-my-zsh cache dir
if [[ ! -d "$HOME/.cache/oh-my-zsh" ]]; then
  mkdir -p "$HOME/.cache/oh-my-zsh" 2>/dev/null
fi
