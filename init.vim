set nocompatible " 設定不和舊 vi 相容，開啟 vim 進階功能支援(ps: neovim 不需要這行)


" --- 插件管理 (set up vim-plug) ---
call plug#begin('~/.config/nvim/autoload')

" 把 vim 變好看
Plug 'reewr/vim-monokai-phoenix' " 仿 sublime 的配色
Plug 'vim-airline/vim-airline' " 強大的狀態列
Plug 'vim-airline/vim-airline-themes'

" 程式編輯器設定
Plug 'scrooloose/nerdtree' " 檔案列表
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic' " 語法檢查
Plug 'kien/ctrlp.vim' " 快速開檔
Plug 'Raimondi/delimitMate' "對應括號
Plug 'christoomey/vim-tmux-navigator' " 用同樣方式切換同畫面 tmux/vim tab
Plug 'pangloss/vim-javascript' " javascript 語法和縮排的插件
Plug 'mxw/vim-jsx' " 臉書官方出的 jsx 插件
Plug 'jez/vim-c0' " C++ 支援
Plug 'jez/vim-ispc' " C 語言支援
Plug 'cakebaker/scss-syntax.vim' " SCSS 支援
Plug 'HTML-AutoCloseTag' " 自動關HTML Tag
"Plug 'airblade/vim-gitgutter' " 顯示這個檔的 git diff
Plug 'edkolev/tmuxline.vim' " 把 tmux 列融入 vim
Plug 'tpope/vim-fugitive' " 在 airline 顯示現在的 branch
Plug 'Valloric/YouCompleteMe' " 自動完成
Plug 'ternjs/tern_for_vim' " 自動完成背後的 JS Engine

call plug#end()


" --- 一般設定 (General Setting) ---
" 用 tab = 2 space 縮排
set cindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set showcmd " 顯示目前 cmd 狀態 (ex: 選了幾行)
let mapleader="\<SPACE>" " 改用空白鍵當 leader key
set splitbelow " 畫面水平時切割放在下方

set relativenumber " 讓人快速的上下移動 打行數 + j or k

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
set t_Co=256 " 這行要放在設 color scheme 前 (ps: neovim 不用這行)
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
" 打「空白鍵 + t」開關檔案列表
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>


" ----- 文法檢查設定 (scrooloose/syntastic) -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map={"mode":"passive", "active_filetypes": [], "passive_filetypes": []}

" 打「空白鍵 + s」開啟/關閉自動文法檢查 (存檔時會檢查)
nmap <silent> <leader>s :SyntasticToggleMode<CR>


" --- 快速開檔設定 (CtrlP) ---
" 打「空白鍵 + o」開啟檔案
nnoremap <Leader>o :CtrlP<CR>
" 打「空白鍵 + f」開啟最近檔案
nnoremap <Leader>f :CtrlPMRUFiles<CR>
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
" 按「空白鍵 + ...」做...
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
