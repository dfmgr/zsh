## zsh  
  
Zsh is a shell designed for interactive use  
  
Automatic install/update:

```shell
bash -c "$(curl -LSs https://github.com/dfmgr/zsh/raw/master/install.sh)"
```

Manual install:
  
requires:

Debian based:

```shell
apt install zsh
```  

Fedora Based:

```shell
yum install zsh
```  

Arch Based:

```shell
pacman -S zsh
```  

MacOS:  

```shell
brew install zsh
```
  
```shell
mv -fv "$HOME/.config/zsh" "$HOME/.config/zsh.bak"
git clone https://github.com/dfmgr/zsh "$HOME/.config/zsh"
ln -sf "$HOME/.config/zsh/zshrc" "$HOME/.zshrc"
git_clone https://github.com/robbyrussell/oh-my-zsh $HOME/.local/share/oh-my-zsh
git_clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.local/share/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git_clone https://github.com/bhilburn/powerlevel9k.git $HOME/.local/share/oh-my-zsh/custom/themes/powerlevel9k
```
  
<p align=center>
  <a href="https://wiki.archlinux.org/index.php/zsh" target="_blank" rel="noopener noreferrer">zsh wiki</a>  |  
  <a href="http://zsh.sourceforge.net" target="_blank" rel="noopener noreferrer">zsh site</a>
</p>  
