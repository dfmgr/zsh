## zsh  
  
Zsh is a shell designed for interactive use - optimized for performance and reliability.

## Performance Optimizations

This zsh configuration benefits from the comprehensive profile optimizations:

- **Fast startup** - Optimized profile and plugin loading
- **Smart caching** - Git operations cached per directory
- **Intelligent completions** - kubectl and other completions cached
- **Error handling** - Protected for reliability

### Key Features

✅ **Shared Optimizations**
- Uses optimized profile from misc
- Git repository detection cached
- Command-not-found with intelligent caching
- kubectl completion cached (regenerates weekly)
- Binary lookups optimized with `command -v`

✅ **Zsh-Specific**
- Oh-My-Zsh framework support
- Powerlevel9k/10k theme compatible
- Syntax highlighting plugin
- Auto-suggestions support
- Advanced completion system

## Installation

### Automatic install/update

```shell
bash -c "$(curl -LSs https://github.com/dfmgr/zsh/raw/main/install.sh)"
```

### Manual install
  
### Requirements

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

## Testing

All configurations validated for:
- Fast startup times
- Proper error handling
- Plugin compatibility
- Theme functionality
  
<p align=center>
  <a href="https://wiki.archlinux.org/index.php/zsh" target="_blank" rel="noopener noreferrer">zsh wiki</a>  |  
  <a href="http://zsh.sourceforge.net" target="_blank" rel="noopener noreferrer">zsh site</a>
</p>  
