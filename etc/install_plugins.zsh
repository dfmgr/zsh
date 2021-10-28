# List of plugins/themes to clone/update
if [[ -f "$HOME/.config/zsh/profile/00-exports.zsh" ]]; then
  source "$HOME/.config/zsh/profile/00-exports.zsh"
fi

if [[ ! -d "$HOME/.local/share/zsh/oh-my-zsh/.git" ]]; then
  echo "Installing oh-my-sh plugin and themes"
  git clone -q "https://github.com/robbyrussell/oh-my-zsh" "$HOME/.local/share/zsh/oh-my-zsh"
fi

if [[ ! -d "$HOME/.local/share/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting/.git" ]]; then
  echo "zsh-syntax-highlighting"
  git clone -q "https://github.com/zsh-users/zsh-syntax-highlighting" "$HOME/.local/share/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting" &>/dev/null
fi

if [[ ! -d "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel9k/.git" ]]; then
  echo "Installing powerlevel9k"
  git clone -q https://github.com/bhilburn/powerlevel9k.git "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel9k"
fi

if [[ ! -d "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel10k/.git" ]]; then
  echo "Installing powerlevel10k"
  git clone -q "https://github.com/romkatv/powerlevel10k.git" "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel10k" &>/dev/null
fi

if [[ ! -d "$HOME/.local/share/zsh/zsh-snap/.git" ]]; then
  echo "Installing zsh-snap"
  git clone -q "https://github.com/marlonrichert/zsh-snap" "$HOME/.local/share/zsh/zsh-snap" &>/dev/null
fi

if [[ ! -d "$HOME/.local/share/zsh/zplug" ]]; then
  echo "Installing zplug"
  git clone -q "https://github.com/zplug/zplug" "$HOME/.local/share/zsh/zplug" &>/dev/null
fi
