# List of plugins/themes to clone/update

if [ -d "$HOME/.local/share/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting/.git" ]; then
   git -C "$HOME/.local/share/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting" pull -q &>/dev/null
else
   git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.local/share/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting" &>/dev/null
fi
if [ -d "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel10k/.git" ]; then
   git -C "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel10k" pull &>/dev/null
else
   git clone https://github.com/romkatv/powerlevel10k.git "$HOME/.local/share/zsh/oh-my-zsh/custom/themes/powerlevel10k" &>/dev/null
fi
