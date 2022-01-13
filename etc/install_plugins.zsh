# List of plugins/themes to clone/update
if [[ -f "$HOME/.config/zsh/profile/00-exports.zsh" ]]; then
  source "$HOME/.config/zsh/profile/00-exports.zsh"
fi
## Update plugins
if [[ -d "$HOME/.local/share/zsh/oh-my-zsh/.git" ]]; then
  echo "Updating oh-my-sh plugin and themes"
  git -C "$HOME/.local/share/zsh/oh-my-zsh" pull &>/dev/null
fi

if [[ -d "$HOME/.local/share/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting/.git" ]]; then
  echo "Updating zsh-syntax-highlighting"
  git -C "$HOME/.local/share/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting" pull &>/dev/null
fi

if [[ -d "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel9k/.git" ]]; then
  echo "Updating powerlevel9k"
  git -C "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel9k" pull &>/dev/null
fi

if [[ -d "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel10k/.git" ]]; then
  echo "Updating powerlevel10k"
  git -C "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel10k" pull &>/dev/null
fi

if [[ -d "$HOME/.local/share/zsh/zsnap/.git" ]]; then
  echo "Updating zsh-snap"
  git -C "$HOME/.local/share/zsh/zsnap" pull &>/dev/null
fi

if [[ -d "$HOME/.local/share/zsh/zplug/.git" ]]; then
  echo "Updating zplug"
  git -C "$HOME/.local/share/zsh/zplug" pull &>/dev/null
fi
## Install plugins
if [[ ! -d "$HOME/.local/share/zsh/oh-my-zsh/.git" ]]; then
  echo "Installing oh-my-sh plugin and themes"
  git clone -q "https://github.com/robbyrussell/oh-my-zsh" "$HOME/.local/share/zsh/oh-my-zsh" &>/dev/null
fi

if [[ ! -d "$HOME/.local/share/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting/.git" ]]; then
  echo "Installing zsh-syntax-highlighting"
  git clone -q "https://github.com/zsh-users/zsh-syntax-highlighting" "$HOME/.local/share/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting" &>/dev/null
fi

if [[ ! -d "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel9k/.git" ]]; then
  echo "Installing powerlevel9k"
  git clone -q "https://github.com/bhilburn/powerlevel9k.git" "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel9k" &>/dev/null
fi

if [[ ! -d "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel10k/.git" ]]; then
  echo "Installing powerlevel10k"
  git clone -q "https://github.com/romkatv/powerlevel10k.git" "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel10k" &>/dev/null
fi

if [[ ! -d "$HOME/.local/share/zsh/zsnap/.git" ]]; then
  echo "Installing zsh-snap"
  git clone -q "https://github.com/marlonrichert/zsh-snap" "$HOME/.local/share/zsh/zsnap" &>/dev/null
fi

if [[ ! -d "$HOME/.local/share/zsh/zplug/.git" ]]; then
  echo "Installing zplug"
  git clone -q "https://github.com/zplug/zplug" "$HOME/.local/share/zsh/zplug" &>/dev/null
fi
