"Forget compatibility with Vi. Who cares.
set nocompatible

"Set the color scheme
colorscheme desert

"Set font type and size
set guifont=Inconsolata\ Medium\ 12

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"Tab options
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3

"Indent stuff
set smartindent
set autoindent
set showmode

"Show command in bottom right portion of the screen
set showcmd

"Switch between buffers withouf saving
set hidden

"Display current cursor position in lower right corner.
set ruler

"Useful command-line completion
set wildmenu
set wildmode=list:longest

set visualbell
set cursorline
set ttyfast
set foldenable


set backspace=indent,eol,start
"Always show the status line
set laststatus=2
"Show number relative to the cursor line
set relativenumber
"Case insensitive search
set ignorecase
set smartcase
set gdefault

"Set incremental searching
set incsearch
set showmatch
"Highlight searching
set hlsearch

"Better line wrapping
set wrap
set textwidth=80
set formatoptions=qrn1

"netrw Configuration
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
