"-------------------------------
" 基本設定
"-------------------------------
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set number
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set clipboard=unnamed             "OSのクリップボードを使用する
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set hidden
set history=50
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu
set vb t_vb=                      "ビープ音を鳴らさない
set ruler                         "カーソルが何行目の何列目に置かれているかを表示する
set shell=/bin/bash
set autoread
filetype plugin indent on
syntax enable
filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins

"-------------------------------
" .vimrc 再読み込み設定
"-------------------------------
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END


"-------------------------------
" プラグイン設定
"-------------------------------
" https://github.com/Shougo/dein.vim
"   $ mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
"   $ git clone https://github.com/Shougo/dein.vim.git \
"       ~/.vim/dein/repos/github.com/Shougo/dein.vim
"
" :call dein#install()
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein'))
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('scrooloose/nerdtree')
  call dein#add('w0ng/vim-hybrid')
call dein#end()

"-------------------------------
" Shougo/neocomplete.vim
" 補完設定
"-------------------------------
" refs https://github.com/Shougo/neocomplete.vim#configuration-examples
source ~/.vim/neocomplete.vimrc
let g:neocomplcache_enable_at_startup = 1
set nocompatible
filetype off
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/vimproc/
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/vimshell.vim/
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/neocomplete.vim/
let g:neocomplete#enable_cursor_hold_i = 1
syntax enable
filetype plugin indent on

"-------------------------------
" scrooloose/nerdtree
" ファイルツリー設定
"-------------------------------
"vimを開いた時にデフォルトでTreeを表示↲
"autocmd VimEnter * execute 'NERDTree'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeShowHidden = 1                "ドットファイルを表示する↲
nnoremap :tree :NERDTreeToggle              ":tree ショートカット
nnoremap <silent><C-e> :NERDTreeToggle<CR>  "Ctrl-e ショットカット

"-------------------------------
" w0ng/vim-hybrid
" カラースキーマ設定
"-------------------------------
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
set background=dark
colorscheme hybrid
syntax on

"-------------------------------
" 行番号の色を設定
" http://qiita.com/mochizukikotaro/items/def041700846adb903fe
"-------------------------------
hi LineNr ctermbg=8 ctermfg=0
hi CursorLineNr ctermbg=4 ctermfg=0
set cursorline
hi clear CursorLine

