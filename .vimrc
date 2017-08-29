"-------------------------------
" 覚えておくと便利なTips
"-------------------------------
" INSERT mode で Ctrl+p : 入力補完


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
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimproc')
  call dein#add('Shougo/vimshell.vim')
  call dein#add('Shougo/vimfiler.vim')
  "call dein#add('scrooloose/nerdtree') "Shougo/vimfiler.vim へ乗り換える
  call dein#add('altercation/vim-colors-solarized')

  " Syntax checking
  call dein#add('scrooloose/syntastic')

  " python向け
  call dein#add('davidhalter/jedi-vim')
call dein#end()

"-------------------------------
" Shougo/unite.vim 設定
" refs http://blog.monochromegane.com/blog/2013/09/18/ag-and-unite/
"-------------------------------
" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

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
"vimを開いた時にデフォルトでTreeを表示
"autocmd VimEnter * execute 'NERDTree'
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeShowHidden = 1                "ドットファイルを表示する↲
"nnoremap :tree :NERDTreeToggle              ":tree ショートカット
"nnoremap <silent><C-e> :NERDTreeToggle<CR>  "Ctrl-e ショットカット

"-------------------------------
" Shougo/vimfiler.vim↲
" ディレクトリエクスプローラ設定
"
" Tips:
"   * ファイラーから展開中の vim へ戻る場合は <TAB> キーで戻れる
"-------------------------------
" vim 実行時に デフォルトではファイルツリーを表示しない
" autocmd VimEnter * execute 'VimFilerBufferDir'
" 隠しファイル扱い
let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$']
" vim 標準ファイルを置き換える
let g:vimfiler_as_default_explorer = 1
" インサートモードで開始しない
let g:unite_enable_start_insert = 0
" :tree / :filer でツリーを開く
noremap <silent> :tree :VimFiler -split -simple -winwidth=45 -no-quit
noremap <silent> :filer :VimFiler -split -simple -winwidth=45 -no-quit
" Ctrl-X と Ctrl+T でツリーを開く
noremap <C-X><C-T> :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>

" Edit file by tabedit.
let g:vimfiler_edit_action = 'edit'
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '|'
let g:vimfiler_tree_closed_icon = '+'
let g:vimfiler_file_icon = ''
let g:vimfiler_marked_file_icon = '*'
nmap <F2>  :VimFiler -split -horizontal -project -toggle -quit<CR>
autocmd FileType vimfiler nnoremap <buffer><silent>/  :<C-u>Unite file -default-action=vimfiler<CR>
autocmd FileType vimfiler nnoremap <silent><buffer> e :call <SID>vimfiler_tree_edit('open')<CR>
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)

" http://baqamore.hatenablog.com/entry/2016/02/13/062555
augroup vimfiler
  autocmd!
  autocmd FileType vimfiler call s:vimfiler_settings()
augroup END
function! s:vimfiler_settings()
  " tree での制御は，<Space>
  map <silent><buffer> <Space> <NOP>
  nmap <silent><buffer> <Space> <Plug>(vimfiler_expand_tree)
  nmap <silent><buffer> <S-Space> <Plug>(vimfiler_expand_tree_recursive)

  " オープンは，<CR>(enter キー)
  nmap <buffer><expr> <CR> vimfiler#smart_cursor_map(
          \ "\<Plug>(vimfiler_cd_file)",
          \ "\<Plug>(vimfiler_open_file_in_another_vimfiler)")


  " マークは，<C-Space>(control-space)
  nmap <silent><buffer> <C-Space> <Plug>(vimfiler_toggle_mark_current_line)
  vmap <silent><buffer> <C-Space> <Plug>(vimfiler_toggle_mark_selected_lines)

  " ウィンドウを分割して開く
  nnoremap <silent><buffer><expr> <C-j> vimfiler#do_switch_action('split')
  nnoremap <silent><buffer><expr> <C-k> vimfiler#do_switch_action('vsplit')

  " 移動，<Tab> だけでなく <C-l> も
  nmap <buffer> <C-l> <plug>(vimfiler_switch_to_other_window)

  " 閉じる，<Esc> 2 回叩き
  nmap <buffer> <Esc><Esc> <Plug>(vimfiler_exit)
endfunction

"-------------------------------
" altercation/vim-colors-solarized
" カラースキーマ設定
"-------------------------------
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
set background=dark
colorscheme desert
syntax enable

"-------------------------------
" 行番号の色を設定
" http://qiita.com/mochizukikotaro/items/def041700846adb903fe
"-------------------------------
hi LineNr ctermbg=8 ctermfg=0
hi CursorLineNr ctermbg=4 ctermfg=0
set cursorline
hi clear CursorLine

"-------------------------------
" davidhalter/jedi-vim
"-------------------------------
let g:jedi#auto_initialization = 0


let g:syntastic_python_checkers = ['pyflakes', 'pep8']

