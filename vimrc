" File
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp,cp932,utf-8
set fileformat=unix
set fileformats=unix,dos,mac
set backup
set backupdir=$HOME/.vim/backup
set swapfile
set directory=$HOME/.vim/swap

" General
set nocompatible
set wildmenu
set virtualedit=block

" Search/
set smartcase
set ignorecase
set hlsearch
set incsearch

" Appearance
set number
set showcmd
set showmode
set showmatch
set textwidth=0
set novisualbell
set vb t_vb=

" Indent
set expandtab
set autoindent
set smarttab
set shiftround
set tabstop=2
set shiftwidth=2
set softtabstop=2

" KeyBind
nnoremap ; :
nnoremap q; q:
nnoremap : ;
nnoremap <TAB> %
vnoremap <TAB> %
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
noremap  <C-s> <ESC>
noremap! <C-s> <ESC>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" NeoBundle
if 0 | endif
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()
" Required:
filetype plugin indent on
NeoBundleCheck

" ColorScheme
" syntax on
syntax enable
set background=dark
colorscheme solarized

" Solarized
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast='normal'
let g:solarized_visibility='normal'
