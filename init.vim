set nocompatible " 設定不和舊 vi 相容，開啟 vim 進階功能支援(ps: neovim 不需要這行)

" --- 插件管理 (set up vim-plug) ---
call plug#begin('~/.config/nvim/plugins')

" 把 vim 變好看
Plug 'reewr/vim-monokai-phoenix' " 仿 sublime 的配色
Plug 'vim-airline/vim-airline' " 強大的狀態列
Plug 'vim-airline/vim-airline-themes'
Plug 'wangchou/vim-auto-highlight' " highlight all occurrences of the current word

" 程式編輯器設定
Plug 'scrooloose/nerdtree' " 檔案列表
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim' " 快速開檔
Plug 'tpope/vim-fugitive' " git in vim
Plug 'christoomey/vim-tmux-navigator' " 用同樣方式(ctrl+方向鍵)切換同畫面 tmux/vim tab
Plug 'jeetsukumaran/vim-buffergator' " nerdtree like buffer navigator
Plug 'mileszs/ack.vim' " faster search
Plug 'vim-scripts/delview' " remove current views created by mkview
Plug 'embear/vim-localvimrc' " local vimrc file for shortcut to run scripts

Plug 'ludovicchabant/vim-gutentags' " 開檔案就自動建tags
Plug 'majutsushi/tagbar' " 用<leader>t來顯示檔案中的tags結構

" JS/CSS
Plug 'pangloss/vim-javascript' " javascript 語法和縮排的插件
Plug 'cakebaker/scss-syntax.vim' " SCSS 支援

" C/C++
Plug 'jez/vim-c0' " C++ 支援
Plug 'jez/vim-ispc' " C 語言支援

" Swift
Plug 'keith/swift.vim'

" https://github.com/clangd/coc-clangd objc
" https://github.com/fannheyward/coc-pyright python
" https://github.com/josa42/coc-sh shell
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ========= 快捷鍵 (Shortcut) ==========
" , 當 vim 的 leader key
"
" ,q        關掉當前 buffer
" ,l        顯示 buffer 列表
" ,,        go to alternative file
"
" ,k        用 cursor 下的字做全域搜尋
" ,a        全域搜尋
" ,t        顯示檔案結構(by ctag)
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
"
" 來自coc.nvim
" gd        go to definition
" gr        coc-references
" ,d        CocDiagnostics
"
" iterm2的設定
" https://stackoverflow.com/a/46018502/2797799
" cmd + [    -> \<C-O>     // 跳到前個位置 in nvim jump list
" cmd + ]    -> \<C-I>     // 跳到下個位置 in nvim jump list
"

let mapleader = ","

" buffer
nmap <leader>q :bp <BAR> bd #<CR>
" nmap <leader>l :b#<CR>
nmap <leader>l :ls<CR>:b<Space>
" previous buffer
nmap <leader>, <C-^><CR>
" next buffer
nmap <leader>. :bn<CR>
" map <leader>b :BuffergatorTabsToggle<CR>

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

" coc.nvim
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" coc.nvim 隱藏 signcolumn
" https://github.com/neoclide/coc.nvim/issues/1554#issuecomment-586622147
autocmd BufRead,BufNewFile * setlocal signcolumn=no
autocmd BufRead,BufNewFile * highlight clear SignColumn

" Coc config/diagnostics
"nmap <leader>c :CocConfig
nmap <leader>d :CocDiagnostics

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" ====== vim 設定 ======
" 用 tab = 4 space 縮排
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
set smarttab
set softtabstop=4
set showcmd " 顯示目前 cmd 狀態 (ex: 選了幾行)
set splitbelow " 畫面水平時切割放在下方
set number " 讓人快速的上下移動 打行數 + j or k
set smartindent
set autochdir

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

" filetype for objc files
let g:filetype_h = 'objc'
let g:filetype_m = 'objc'

" use <Leader>h to hide status bar
" https://unix.stackexchange.com/a/140899
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
"        set nonumber
        hi EndOfBuffer ctermfg=235
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        set number
        hi EndOfBuffer ctermfg=100
    endif
endfunction

"nnoremap <S-h> :call ToggleHiddenAll()<CR>
nnoremap <Leader>h :call ToggleHiddenAll()<CR>

" ====== 插件設定 ======
" --- 狀態列設定 (vim-airline) ---
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts=0
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
" nnoremap <leader>d :TernDef<CR>|

" rename variable under cursor
" nnoremap <leader>r :TernRename<CR>



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

" let g:airline#extensions#ale#enabled = 1

" let g:ale_fix_on_save = 1
" let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" nerdtree width
let g:NERDTreeWinSize=30

" for vim-auto-hightlight
set updatetime=500

" localvimrc
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0

" for tagbar
let g:buffergator_suppress_keymaps=1
nmap <leader>t :TagbarToggle<CR>

let g:tagbar_type_javascript = {'ctagsbin': 'jsctags'}

" from https://github.com/majutsushi/tagbar/wiki#obj-c
" add a definition for Objective-C to tagbar
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
    \ }

" swift-autocomplete
" autocmd BufNewFile,BufRead *.swift set filetype=swift
"autocomplete_swift#use_toolchain('Swift_4_2')
"

" crontab
autocmd filetype crontab setlocal nobackup nowritebackup
"set expandtab

autocmd FileType javascript set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab

" ctag
let g:gutentags_ctags_executable = '/opt/homebrew/Cellar/universal-ctags/HEAD-6f4a48a/bin/ctags'
" https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
"let g:gutentags_generate_on_new = 1
"let g:gutentags_generate_on_missing = 1
"let g:gutentags_generate_on_write = 1
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
