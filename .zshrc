export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="muse"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:phantomjs-2.1.1-macosx/bin"

# misc shortcut
alias siri='say hey siri;say '
alias h='history'
alias hg='history|grep'
alias s='source ~/.zshrc'
alias z='vim ~/.zshrc'

# vim
alias v='nvim'
alias gv='cd ~/.local/share/nvim'
alias vinit="vim ~/.config/nvim/init.vim"
alias rv='rm -f ~/.local/share/nvim/view/*'

# tokyo aws
alias tokyo='ssh -i tokyo_need_for_speed.pem ubuntu@54.199.254.225'
alias tt='ssh -i tokyo_need_for_speed.pem -D 2001 -f -C -q -N ubuntu@54.199.254.225' # ssh tunneling vpn

# npm & yarn
function r = {
  tmp=`git ls-files|grep yarn.lock`
  if [ $? -eq 0 ]; then
    yarn run local
  else
    npm run local
  fi
}
function i = {
  tmp=`git ls-files|grep yarn.lock`
  if [ $? -eq 0 ]; then
    yarn install
  else
    npm i
  fi
}
function t = {
  tmp=`git ls-files|grep yarn.lock`
  if [ $? -eq 0 ]; then
    yarn t
  else
    npm t
  fi
}

# webpack
export WEBPACK_HAPPY_CACHE_ENABLED=1
export WEBPACK_BREAKPOINT_DISABLED=1
export WEBPACK_HAPPY_THREAD_SIZE=4

# git shortcuts
alias d='git checkout develop'
alias p='git pull'
alias rh='git reset HEAD --hard'
alias rhd='git reset HEAD --hard;git checkout develop'
alias gl="git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s' --graph"
alias gl2="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
function push = {
  local currentBranchName="$(git branch | grep \* | cut -d ' ' -f2)"
  git push origin ${currentBranchName}
}
alias fpush="git push -f origin " # type the force push branch name manually
alias gs="git status"
alias am="git add .;git commit -m "

# tree
alias dl="tree -d -L 1"
alias dl2="tree -d -L 2"
alias dl3="tree -d -L 3"
alias l="tree -L 1"
alias l2="tree -L 2"
alias l3="tree -L 3"

# tmux
alias yo="zsh ~/yoyogi.sh"
alias ta='tmux attach'

# ruby
export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi
export PATH="~/bin:${PATH}"

# zsh
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
