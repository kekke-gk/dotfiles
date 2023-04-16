"---------------------------------------------------------------------------
" File
"

set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp,cp932
set fileformat=unix
set fileformats=unix,dos,mac
set history=1000
set autoread
set nowritebackup
set nobackup
set noswapfile
set undodir=~/.vim/undo
set undofile


"---------------------------------------------------------------------------
" General
"

let mapleader = "\<Space>"
set nocompatible
set wildmenu
set wildmode=longest:full,full
set modeline
set virtualedit=block
set backspace=indent,eol,start
set hidden
set infercase
set scrolloff=8
set splitbelow
set splitright
set secure
set clipboard=unnamed,unnamedplus
set lazyredraw
set switchbuf=useopen,usetab,newtab
set timeoutlen=500
set iskeyword-=_


"---------------------------------------------------------------------------
" Search
"

set smartcase
set ignorecase
set hlsearch
set incsearch
set magic


"---------------------------------------------------------------------------
" Appearance
"

set number
set ruler
set showcmd
set cmdheight=1
set showtabline=2
set showmatch
set matchpairs+=<:>
set matchtime=2
set textwidth=0
set noerrorbells
set novisualbell
set vb t_vb=
set cursorline
" set nolist
" set listchars=
set list
set listchars=tab:»-
set colorcolumn=80


"---------------------------------------------------------------------------
" Indent
"

set autoindent
set smartindent
set expandtab
set smarttab
set shiftround
set tabstop=4
set shiftwidth=4
set softtabstop=4


"---------------------------------------------------------------------------
" KeyBind
"

" Fast saving
nnoremap <leader>w :w!<cr>

" Exchange of ; for :
nnoremap q; q:
nnoremap ; :
nnoremap : ;

" Remap VIM 0 to first non-blank character
map 0 ^

" Move to pair by <TAB>
nnoremap <TAB> %
vnoremap <TAB> %

" Search selected word
vnoremap * "zy:let @/ = @z<CR>nN"

" Use <C-s> as <ESC>
noremap  <C-s> <ESC>
noremap! <C-s> <ESC>

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Emacs keybind
" Move cursor on Insert Mode and CommandLine Mode
noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <C-a> <Home>
noremap! <C-e> <End>

" Move cursor on CommandLine Mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Move cursor on Visual Mode
vnoremap <C-a> <Home>
vnoremap <C-e> <End>

" Control window size
nnoremap <leader><Left>  <C-w><
nnoremap <leader><Right> <C-w>>
nnoremap <leader><Up>    <C-w>-
nnoremap <leader><Down>  <C-w>+

" Redraw line at center when search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Move cursor as display line
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <leader><cr> :noh<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Usefull commands
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>
command W w !sudo tee % > /dev/null
cnoremap bin %!xxd -g 1
cnoremap binr %!xxd -r

" Display multiple candidates on splited window
nnoremap <C-]> :sp<CR> :exe("tjump ".expand('<cword>'))<CR>

"---------------------------------------------------------------------------
" Autocmd
"

" Remember the last cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Open binary mode
augroup BinaryXXD
    autocmd!
    autocmd BufReadPre  *.bin let &binary =1
    autocmd BufReadPost * if &binary | silent %!xxd -g 1
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &binary | execute "%!xxd -r" | endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END

" Strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e


"---------------------------------------------------------------------------
" Plugins
"

try
source ~/.vim/vimrcs/plugins_config.vim
catch
endtry


"---------------------------------------------------------------------------
" ColorScheme
"

syntax enable
set background=dark
" set background=light
colorscheme solarized

if g:colors_name == 'solarized'
    "-----------------------------------------------------------------------
    " Solarized
    "
    let g:solarized_termcolors=16
    let g:solarized_termtrans=0
    let g:solarized_degrade=0
    let g:solarized_bold=1
    let g:solarized_underline=1
    let g:solarized_italic=1
    let g:solarized_contrast='normal'
    let g:solarized_visibility='normal'
endif


py3 << EOF
import os, sys, pathlib
if 'VIRTUAL_ENV' in os.environ:
    venv = os.getenv('VIRTUAL_ENV')
    site_packages = next(pathlib.Path(venv, 'lib').glob('python*/site-packages'), None)
    if site_packages:
        sys.path.insert(0, str(site_packages))
EOF

set pythondll=/home/kekke/.virtualenvs/env-my/bin/python
set omnifunc=jedi#completions
