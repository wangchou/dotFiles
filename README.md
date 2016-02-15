# VIM-as-a-JS-IDE-for-Mac

![alt text](https://photos-4.dropbox.com/t/2/AADmwZvmPsK5HKB2eqjMXGqNny_lTdMVg9CGGKZXsag_wA/12/20097932/jpeg/32x32/3/1455523200/0/2/Screen%20Shot%202016-02-15%20at%2011.32.23%20AM.jpg/ELXuhg8YozIgBygH/-Ff_fFEB2LAzq9zAiikFByMmD382tnJz03a-nmePk2A?size_mode=3&size=1600x1200 "sceenshot")

### Color scheme Setting
iTerm2 
color: molokai
Regular Font: Source Code Pro
Non-Ascii Font: Melo for Powerline

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
brew install neovim/neovim/neovim
```

### 安裝 vim-plug
```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 下載 init.vim 設定檔
放到 ~/.config/nvim/init.vim

### 打開 neovim 安裝
:PlugInstall

### 編譯 YouCompleteMe
安裝 python 2.7 & pip
```
pip install neovim
cd ~/.config/nvim/autoload/plugged/YouCompleteMe
./install.py --clang-completer --tern-completer
```

ps: 如果這步用 nvm 安裝的 node 會有問題，要這樣...
VIM setting for YouCompleteMe and TernJS
```
ln -s `which node` /usr/local/bin/node
ln -s `which npm` /usr/local/bin/npm
ln -s `which tern` /usr/local/bin/tern
ln -s `which eslint` /usr/local/bin/eslint
```

### 安裝文法檢查 Syntastic
必須把 eslint, eslintxxxreact, eslintxxxairbnb 都用 npm -g install

### 建立 Symbolic link
```
brew uninstall vim
ln /usr/local/bin/nvim /usr/local/bin/vim
mv ~/.vim ~/.old.vim
mv ~/.vimrc ~/.old.vimrc
ln -s ~/.config/nvim ~/.vim
ln -s ~/.config/nvim/init.vim ~/.vimrc
```

### git config
```
git config --global core.editor /usr/local/bin/nvim
```

---
參考：
https://github.com/jez/vim-as-an-ide/commit/0673f0c
https://davidosomething.com/blog/vim-for-javascript/
