set nocompatible " 設定不和舊 vi 相容，開啟 vim 進階功能支援


" --- 插件管理 (set up Vundle) ---
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Vim 套件管理系統

" Making Vim look good
Plugin 'reewr/vim-monokai-phoenix' " 仿 sublime 的配色
Plugin 'vim-airline/vim-airline' " 強大的狀態列
Plugin 'vim-airline/vim-airline-themes'

" Vim as a programmer's text editor
Plugin 'scrooloose/nerdtree' " 檔案列表
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic' " Syntax 檢查
Plugin 'kien/ctrlp.vim' " 快速開檔
Plugin 'Raimondi/delimitMate' "對應括號
Plugin 'christoomey/vim-tmux-navigator' " 用同樣方式切換同畫面 tmux/vim tab
Plugin 'pangloss/vim-javascript' " javascript syntax and indent 插件
Plugin 'mxw/vim-jsx' " fb官方出的 jsx 插件
Plugin 'jez/vim-c0' " C++ 支援
Plugin 'jez/vim-ispc' " C 語言支援
Plugin 'cakebaker/scss-syntax.vim' " SCSS 支援
Plugin 'HTML-AutoCloseTag' " 自動關HTML Tag
Plugin 'airblade/vim-gitgutter' " 顯示這個檔的 git diff
Plugin 'edkolev/tmuxline.vim' " 把 tmux 列融入 vim
Plugin 'tpope/vim-fugitive' " 在 airline 顯示現在的 branch
Plugin 'Valloric/YouCompleteMe' " 自動完成
Plugin 'ternjs/tern_for_vim' " 自動完成背後的 JS Engine

call vundle#end()

filetype plugin indent on


" --- 一般設定 (General Setting) ---
" 用 tab = 2 space 縮排
set cindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set showcmd " 顯示目前 cmd 狀態 (ex: 選了幾行)

"搜尋相關
set incsearch
set showmatch
set hlsearch

" 文字編碼設定
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,utf-16,big5,cp950,cp936,gb18030,euc-jp,euc-kr,latin1

" 顯示空白
set backspace=indent,eol,start
set listchars=tab:>-,trail:~
set list

" 新正規表示式引擎 for Vim-javascript 插件
set regexpengine=1

" 支援軌跡板 scroll
set mouse=a

" 顏色 & 字型
set guifont=Source\ Code\ Pro
set t_Co=256
set background=dark
colorscheme monokai-phoenix

" 文法開啟
syntax enable

" 設訂狀態列 for airline 插件
set laststatus=2


" 在正常模式中，封鎖方向鍵
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" 在正常模式中，按 shift 鍵大跳
map J 10j
map K 10k

" 存檔時移除行尾空白
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" 插入模式按 jj 切回正常模式
inoremap jj <Esc>

" 用空白鍵開關 fold
nnoremap <space> za
vnoremap <space> zf
set foldmethod=indent
set foldlevelstart=20

" 移到搜尋的前/下一個時，畫面置中
map N Nzz
map n nzz


" ====== 插件設定 ======
" --- 狀態列設定 (vim-airline) ---
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1


" --- 檔案列表設定 (jistr/vim-nerdtree-tabs) ---
" 透過打 \t 開關檔案列表
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>


" ----- 文法檢查設定 (scrooloose/syntastic) -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_javascript_checkers = ['eslint']

" 透過打 \s 開啟文法檢查
nmap <silent> <leader>s :SyntasticCheck<CR>
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" --- 快速開檔設定 (CtrlP) ---
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


" ----- 對應括號設定 (Raimondi/delimitMate settings) -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END


" --- 自動完成 & JS 分析設定 (YouCompleteMe & Ternjs) ---
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
