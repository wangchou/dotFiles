# VIM-as-a-JS-IDE-for-Mac

### Color scheme Setting
iTerm2
* color: molokai
* Regular Font: [Inconsolata 16pt](https://github.com/google/fonts/blob/master/ofl/inconsolata/Inconsolata-Regular.ttf)
* Non-Ascii Font: [Melo for Powerline 13pt](https://gist.github.com/justinmayer/7537418)

### 安裝 homebrew
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### 安裝 xcode compiler
```
xcode-select --install
```

### 安裝 neovim
```
brew install neovim
pip3 install neovim
```

### 安裝 neovim plugin by VimPlug
```bash
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp init.vim ~/.config/nvim/init.vim # download init.vim from this repo
vim
:PlugInstall
```

### 建立 Symbolic link
```bash
brew uninstall vim
ln /usr/local/bin/nvim /usr/local/bin/vim
mv ~/.vim ~/.old.vim
mv ~/.vimrc ~/.old.vimrc
ln -s ~/.config/nvim ~/.vim
ln -s ~/.config/nvim/init.vim ~/.vimrc
```

### git config
```bash
git config --global core.editor /usr/local/bin/nvim
```

---
參考：
* https://github.com/jez/vim-as-an-ide/commit/0673f0c
* https://davidosomething.com/blog/vim-for-javascript/
* https://medium.com/@alexlafroscia/writing-js-in-vim-4c971a95fd49
