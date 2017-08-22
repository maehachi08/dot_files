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
set paste
set vb t_vb=                      "ビープ音を鳴らさない
set ruler                         "カーソルが何行目の何列目に置かれているかを表示する
set shell=/bin/bash
set autoread
filetype plugin indent on
syntax enable

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
call dein#end()

"-------------------------------
" scrooloose/nerdtree
" ファイルツリー設定
"-------------------------------
"vimを開いた時にデフォルトでTreeを表示↲
autocmd VimEnter * execute 'NERDTree'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeShowHidden = 1                "ドットファイルを表示する↲
nnoremap :tree :NERDTreeToggle              ":tree ショートカット
nnoremap <silent><C-e> :NERDTreeToggle<CR>  "Ctrl-e ショットカット

