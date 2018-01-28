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
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim' " 快速開檔
Plug 'christoomey/vim-tmux-navigator' " 用同樣方式切換同畫面 tmux/vim tab
Plug 'pangloss/vim-javascript' " javascript 語法和縮排的插件
Plug 'jez/vim-c0' " C++ 支援
Plug 'jez/vim-ispc' " C 語言支援
Plug 'cakebaker/scss-syntax.vim' " SCSS 支援
Plug 'edkolev/tmuxline.vim' " 把 tmux 列融入 vim
Plug 'mileszs/ack.vim' " faster search
Plug 'jeetsukumaran/vim-buffergator' " nerdtree like buffer navigator
Plug 'vim-scripts/delview'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " 自動完成
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " 自動完成
Plug 'ternjs/tern_for_vim' " 自動完成背後的 JS Engine
Plug 'maxmellon/vim-jsx-pretty'
Plug 'w0rp/ale' " linter error and fix


call plug#end()

" ========= 快捷鍵 (Shortcut) ==========
" , 當 vim 的 leader key
"
" ,q        關掉當前 buffer
" ,l        到前一個 buffer
" ,,       顯示 buffer 列表
"
" ,k        用 cursor 下的字做全域搜尋
" ,a        全域搜尋
"
" ctrl + o  搜尋檔名
" ctrl + f  搜尋最近的檔案
" ,j        用 cursor 下的字搜尋檔案
"
" ,f        fold and unfold
" {         全選 block 內的行數
"
" K         移到前一個 mark
" J         移到下一個 mark
"
" space     開關 nerdtree
"
" tab       切換到下個 window
"
" jj        回到 normal mode

let mapleader = ","

" buffer
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>l :b#<CR>
nmap <leader>bl :ls<CR>:b<Space>
map <leader>, :BuffergatorTabsOpen<CR>

" search
nnoremap <leader>k :Ack! <C-R><C-W> <CR>
vnoremap <leader>k y:Ack! <C-R>"<CR>
nnoremap <leader>a :Ack! --smart-case -m 30<space>

" open file
nnoremap <C-o> :CtrlP<CR>
nnoremap <C-f> :CtrlPMRUFiles<CR>
nmap <leader>j :CtrlP<CR><C-\>w

" select & folding
nnoremap <leader>f za
vnoremap <leader>f zf
nnoremap { $%v%
nmap } ^lv%f

" marks
map K [`
map J ]`

" others
nmap <space> :NERDTreeToggle<CR>
nnoremap <tab> <C-W><C-W>
inoremap jj <Esc>

" ====== vim 設定 ======
" 用 tab = 2 space 縮排
set tabstop=2 shiftwidth=2 expandtab
set cindent
set smarttab
set softtabstop=2
set showcmd " 顯示目前 cmd 狀態 (ex: 選了幾行)
set splitbelow " 畫面水平時切割放在下方
set number " 讓人快速的上下移動 打行數 + j or k

" 禁用方向鍵
map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>

" 搜尋相關
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
set guifont=Inconsolata
set t_Co=256 " 這行要放在設 color scheme 前 (ps: neovim 不用這行)
set background=dark
colorscheme monokai-phoenix

" 文法開啟
syntax enable

" 設訂狀態列 for airline 插件
set laststatus=2

" 存檔時移除行尾空白
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" set clipboard work with tmux
set clipboard=unnamedplus

" for JS Folding
setlocal foldmethod=manual

" type % to matching the html tag
runtime macros/matchit.vim

" 自動儲存 View
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

" 移到搜尋的前/下一個時，畫面置中
map N Nzz
map n nzz

set hidden

" crosshairs (highlight 欄和列)
hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" close the quickfix window after selection
:autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>


" ====== 插件設定 ======
" --- 狀態列設定 (vim-airline) ---
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_section_x=0
let g:airline_section_y=0
let g:airline_section_error=0
let g:airline_section_warning=0

" --- 快速開檔設定 (CtrlP) ---
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " use silver search

" --- 搜尋 (ack) ---
let g:ackprg = 'ag --vimgrep' " much faster silver search
let g:ackhighlight = 1
let g:ack_qhandler = "botright copen 20"

" --- Vim buffernavigator ---
let g:buffergator_show_full_directory_path = 0 " use relative path
let g:buffergator_sort_regime = 'filepath' " sort buffer file by path
let g:buffergator_split_size = 30 " buffer window width

" 按「leader key + ...」做...
" go to definition
nnoremap <leader>d :TernDef<CR>|

" rename variable under cursor
nnoremap <leader>r :TernRename<CR>

" vim-jsx-pretty highlight jsx like html
let g:vim_jsx_pretty_enable_jsx_highlight = 0

highlight def link jsxTag Label
highlight def link jsxTagName Label
highlight def link jsxCloseTag Label
highlight def link jsxCloseString Label

highlight def link jsxString String
highlight def link jsxNameSpace Function
highlight def link jsxComment Error
highlight def link jsxAttrib Identifier
highlight def link jsxEscapeJs jsxEscapeJs

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" linter autofix
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_linters = {
\   'javascript': ['prettier', 'eslint'],
\}

let g:airline#extensions#ale#enabled = 1

let g:ale_fix_on_save = 1
" let g:ale_sign_column_always = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
