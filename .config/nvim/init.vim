set nocompatible                " turn off vi-compatible mode

" change the mapleader from \ to ,
let mapleader=","
let maplocalleader="\\"

" Editing behaviour {{{
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set relativenumber
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
"set virtualedit=all            " allow the cursor to go in to invalid places
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
"set gdefault                   " search/replace globally (on a line) by default
"set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

set nolist                      " don't show invisible characters by default,
                                " but it is enabled for some file types (see later)
"set pastetoggle=<F2>           " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
set mouse=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)
set fileformats="unix,dos,mac"
set formatoptions+=1            " when wrapping paragraphs, don't end lines
                                "    with 1-letter words (looks stupid)

"set nrformats=                 " make <C-a> and <C-x> play well with
                                "    zero-padded numbers (i.e. don't consider
                                "    them octal or hex)

"set shortmess+=I               " hide the launch screen
set clipboard=unnamed           " normal OS clipboard interaction
set autoread                    " automatically reload files changed outside of Vim
set updatetime=1000             " speed up the updatetime so gitgutter and friends are quicker
set ttyfast                     " make the keyboard faaaaaaast
set timeout timeoutlen=1000 ttimeoutlen=50

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
" }}}

" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=1                " add a fold column
set foldmethod=syntax           " detect triple-{ style fold markers
set foldlevelstart=10           " start out with everything unfolded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" }}}

" Editor layout {{{
colorscheme base16-classic-dark " choosing the color scheme
syntax on                      " turn on syntax highlight
set termguicolors              " enable truecolor
set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set cmdheight=1                 " use a status bar that is 1 rows high
"set columns=85
"set lines=35
"winpos 50 0                    " Center window
" }}

" Vim behaviour {{{
set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set undofile                    " keep a persistent backup file
set undodir=~/.vim/.undo,~/tmp,/tmp
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                "    than 80 lines of registers
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
set nocursorline                " don't highlight the current line (useful for quick orientation, but also slow to redraw)
" }}}


" Shortcut mappings {{{

" Clears the search register
"nnoremap <silent> <leader>/ :noh<CR>
" Shortcut for NERDtree
map <leader>/ :NERDTreeToggle<CR>
"nnoremap <leader>, :set cursorline!<cr>  " toggle highlighting the cursor line

" Since I never use the ; key anyway, this is a real optimization for almost
" all Vim commands, as I don't have to press the Shift key to form chords to
" enter ex mode.
"nnoremap ; :
"nnoremap <leader>; ;

" toggle show/hide invisible chars
"nnoremap <leader>I :set list!<cr>

" toggle line numbers
"nnoremap <leader>N :setlocal number!<cr>

" thanks to Steve Losh for this liberating tip
" tee http://stevelosh.com/blog/2010/09/coming-home-to-vim
"nnoremap / /\v
"vnoremap / /\v

" Use Q for formatting the current paragraph (or visual selection)
"vnoremap Q gq
"nnoremap Q gqap
" set breakindent on  " keep paragraph indentation when re-wrapping text

" Sort paragraphs
"vnoremap <leader>s !sort -f<CR>gv
"nnoremap <leader>s vip!sort -f<CR><Esc>

" make p in Visual mode replace the selected text with the yank register
"vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>


" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
"nnoremap ' `
"nnoremap ` '

" Easy window navigation
"noremap <C-h> <C-w>h
"noremap <C-j> <C-w>j
"noremap <C-k> <C-w>k
"noremap <C-l> <C-w>l
"noremap <leader>w <C-w>v<C-w>l

" Complete whole filenames/lines with a quicker shortcut key in insert mode
"inoremap <C-f> <C-x><C-f>
"inoremap <C-l> <C-x><C-l>

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
"nnoremap <silent> <leader>d "_d
"vnoremap <silent> <leader>d "_d
" vnoremap <silent> x "_x  TODODODOOo

" Pull word under cursor into LHS of a substitute (for quick search and
" replace)
"nnoremap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Quick alignment of text
" nnoremap <leader>al :left<CR>
" nnoremap <leader>ar :right<CR>
" nnoremap <leader>ac :center<CR>

" Ctrl+W to redraw the buffer's contents
"
" For some reason unclear to me, new files opened via the quickfix window
" (for example Flow errors triggered in unopened files) don't get
" their file types detected automatically.  For these new buffers, the
" filetype= (empty).
"
" This can be fixed by running
"
"     :filetype detect
"
" In those buffers, but this is super laborious.  This just plugs that
" under my existing "refresh the screen" shortcut <c-w>.
"nnoremap <C-w> :filetype detect<cr>:redraw!<cr>

" Reselect text that was just pasted with ,v
"nnoremap <leader>v V`]
" }}}
let g:deoplete#enable_at_startup = 1
