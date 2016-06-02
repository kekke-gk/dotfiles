"---------------------------------------------------------------------------
" File
"

set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp,cp932
set fileformat=unix
set fileformats=unix,dos,mac
set history=1000
set nowritebackup
set nobackup
" set backupdir=$HOME/.vim/backup
set noswapfile
" set directory=$HOME/.vim/swap


"---------------------------------------------------------------------------
" General
"

set nocompatible
set wildmenu
set modeline
set virtualedit=block
set backspace=indent,eol,start
set hidden
set infercase
set scrolloff=8
set splitbelow
set splitright
set secure


"---------------------------------------------------------------------------
" Search
"

set smartcase
set ignorecase
set hlsearch
set incsearch


"---------------------------------------------------------------------------
" Appearance
"

set number
set showcmd
set showtabline=1
set showmatch
set matchpairs+=<:>
set textwidth=0
set novisualbell
set vb t_vb=
set cursorline
set nolist
set listchars=


"---------------------------------------------------------------------------
" Indent
"

set expandtab
set autoindent
set smarttab
set shiftround
set tabstop=4
set shiftwidth=4
set softtabstop=4


"---------------------------------------------------------------------------
" KeyBind
"

" Exchange of ; for :
nnoremap q; q:
nnoremap ; :
" nnoremap ; q:i
nnoremap : ;

" Move to pair by <TAB>
nnoremap <TAB> %
vnoremap <TAB> %

vnoremap * "zy:let @/ = @z<CR>nN"

" Use <C-s> as <ESC>
noremap  <C-s> <ESC>
noremap! <C-s> <ESC>

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move cursor on Insert Mode
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Move cursor on Command Mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" Move cursor on Visual Mode
vnoremap <C-a> <Home>
vnoremap <C-e> <End>

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

" Usefull commands
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>
cnoremap bin %!xxd -g 1
cnoremap binr %!xxd -r


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
" NeoBundle or Dein.vim
"

let s:useNeoBundle = 0
if s:useNeoBundle
    "-----------------------------------------------------------------------
    " NeoBundle
    "
    if 0 | endif
    if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'

    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'tomtom/tcomment_vim'
    NeoBundle 'altercation/vim-colors-solarized'
    NeoBundle 'lilydjwg/colorizer'
    NeoBundle 'thinca/vim-quickrun'
    NeoBundle 'itchyny/lightline.vim'
    NeoBundle 'Shougo/neocomplcache.vim'
    NeoBundle 'Shougo/unite.vim'

    NeoBundle 'tpope/vim-surround'

    NeoBundle 'mattn/emmet-vim'
    NeoBundle 'othree/html5.vim'
    NeoBundle 'hail2u/vim-css3-syntax'
    NeoBundle 'jelera/vim-javascript-syntax'

    call neobundle#end()
    filetype plugin indent on
    NeoBundleCheck
else
    "-----------------------------------------------------------------------
    " Dein.vim
    "
    set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
    call dein#begin(expand('~/.cache/dein'))

    call dein#add('Shougo/dein.vim')
    " call dein#add('Shougo/vimproc.vim', {
    "             \ 'build': {
    "             \     'linux': 'make',
    "             \     'unix': 'gmake',
    "             \     'windows': 'tools\\update-dll-mingw',
    "             \     'cygwin': 'make -f make_cygwin.mak',
    "             \     'mac': 'make -f make_mac.mak',
    "             \    },
    "             \ })
    call dein#add('scrooloose/nerdtree')
    call dein#add('tomtom/tcomment_vim')
    call dein#add('altercation/vim-colors-solarized')
    call dein#add('lilydjwg/colorizer')
    call dein#add('thinca/vim-quickrun')
    call dein#add('itchyny/lightline.vim')
    " call dein#add('Shougo/neocomplcache.vim')
    call dein#add('Shougo/neocomplete.vim')
    call dein#add('Shougo/unite.vim')
    " call dein#add('tpope/vim-surround')
    call dein#add('Townk/vim-autoclose')

    " HTML / CSS / JS
    call dein#add('mattn/emmet-vim', {'on_ft': ['html', 'css']})
    call dein#add('othree/html5.vim', {'on_ft': 'html'})
    call dein#add('hail2u/vim-css3-syntax', {'on_ft': 'css'})
    call dein#add('jelera/vim-javascript-syntax', {'on_ft': 'javascript'})

    " Ruby
    call dein#add('tpope/vim-endwise', {'on_ft': 'ruby'})

    " Rails
    " call dein#add('tpope/vim-rails')

    " Processing
    call dein#add('sophacles/vim-processing', {'on_ft': 'processing'})

    " Python
    " call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
    " call dein#add('kevinw/pyflakes-vim', {'on_ft': 'python'})
    " call dein#add('nvie/vim-flake8', {'on_ft': 'python'})

    call dein#end()
    call dein#save_state()

    if has('vim_starting') && dein#check_install()
        call dein#install()
    endif

    filetype plugin indent on
endif


"---------------------------------------------------------------------------
" ColorScheme
"

syntax enable
" set background=dark
set background=light
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


"---------------------------------------------------------------------------
" vim-quickrun
"

let g:quickrun_config = {}
let g:quickrun_config.c = { 'cmdopt' : '-lm' }
let g:quickrun_config.cpp = { 'cmdopt' : '-std=c++14' }
" let g:quickrun_config.processing = {
"             \ 'command': 'processing-java',
"             \ 'exec': '%c --force --sketch=$PWD/ --output=/tmp/Processing --run ',
"             \ }


"---------------------------------------------------------------------------
" lightline
"

set laststatus=2
set t_Co=256
set noshowmode
let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ }


"---------------------------------------------------------------------------
" neocomplete
"

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
