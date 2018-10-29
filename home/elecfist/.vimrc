set nocompatible                   " turn off vi-compatible mode

" change the mapleader from \ to ,
"let mapleader=","
"let maplocalleader="\\"

" Editing behaviour {{{
if !has('nvim')
    filetype plugin indent on       " ?
    set autoindent                  " always set autoindenting on
    set autoread                    " automatically reload files changed outside of Vim
    set backspace=indent,eol,start  " allow backspacing over everything in insert mode
    set formatoptions=tcqj          " ?
    set hlsearch                    " highlight search terms
    set incsearch                   " show search matches as you type
    set listchars=tab:▸\ ,trail:·,extends:#,nbsp:· " ?
    set mouse=a                     " enable using the mouse if terminal emulator if allowed
    set nrformats=bin,hex           " make <C-a> and <C-x> play well with zero-padded numbers (i.e. don't consider them octal or hex)
    set sessionoptions-=options     " ?
    set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
    set tabpagemax=50               " ?
    set ttyfast                     " make the keyboard fast
endif

"set tags= ./tags;,tags          " ?
set clipboard=unnamed           " normal OS clipboard interaction
set copyindent                  " copy the previous indentation on autoindenting
set expandtab                   " expand tabs by default (overloadable per file type later)
set fileformats="unix,dos,mac"  " ?
set ignorecase                  " ignore case when searching
set nolist                      " don't show invisible characters by default, but it is enabled for some file types (see later)
set noshowmode                  " do not show what mode currently editing in
set nowrap                      " don't wrap lines
set nonumber                      " always show line numbers
set relativenumber              " show line number relative to the current line
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=4                " number of spaces to use for autoindenting
set showmatch                   " set show matching parenthesis
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set tabstop=4                   " a tab is four spaces
set timeout timeoutlen=1000 ttimeoutlen=50  " ?
set updatetime=1000             " speed up the updatetime so gitgutter and friends are quicker
" }}}

" Folding rules {{{
set foldcolumn=1                " add a fold column
set foldenable                  " enable folding
set foldlevelstart=10           " start out with everything unfolded
set foldmethod=syntax           " detect triple-{ style fold markers
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" }}}

" Editor layout {{{
if !has('nvim')
    set noruler
    set laststatus=2                " tell VIM to always put a status line in, even
                                    " if there is only one window
elseif has('nvim')
    colorscheme base16-classic-dark " choosing the color scheme
    set display=lastline,msgsep
endif

syntax on                      " turn on syntax highlight
set termguicolors              " enable truecolor
set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set cmdheight=1                 " use a status bar that is 1 rows high

" }}}

" status line configuration {{{

let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

hi User1 guifg=#000000 guibg=#afdf00
hi User2 guifg=#606060 guibg=#121212

set statusline=
set statusline+=%1*\ %{toupper(g:currentmode[mode()])}\   " Current mode
set statusline+=%2*\ <%t>                        " file name (tail of the path)
set statusline+=%y                        " filetype
set statusline+=%m                          " modify flag
set statusline+=%=                          " switch to the right side
set statusline+=%1*\ %l:%c\                   " line:column
" }}}


" Vim behaviour {{{
if !has('nvim')
    set cscopeverbose
    set directory=~/.vim/.tmp,~/tmp,/tmp
                                    " store swap files in one of these directories
                                    "    (in case swapfile is ever turned on)
    set history=1000                " remember more commands and search history
    set belloff=all
    set complete=i                  " scan current file and included files for completion
    set langnoremap
    set nolangremap
    set showcmd                     " show (partial) command in the last line of the screen
                                    "    this also shows visual selection info
    set sidescroll=1
    set undodir=~/.vim/.undo,~/tmp,/tmp
    set wildmenu                    " make tab completion for files/buffers act like bash
endif

set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers set undolevels=1000             " use many muchos levels of undo set undofile                    " keep a persistent backup file set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                "    than 80 lines of registers
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set nomodeline                  " disable mode lines (security measure)
set nocursorline                " don't highlight the current line (useful for quick orientation, but also slow to redraw)
" }}}

" Shortcut mappings {{{

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" toggle highlighting the cursor line
nnoremap <leader>cl :set cursorline!<cr>

" toggle show/hide invisible chars
nnoremap <leader>I :set list!<cr>

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>w <C-w>v<C-w>l

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

" Complete whole filenames/lines with a quicker shortcut key in insert mode
"inoremap <C-f> <C-x><C-f>
"inoremap <C-l> <C-x><C-l>

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
"nnoremap <silent> <leader>d "_d
"vnoremap <silent> <leader>d "_d
"vnoremap <silent> x "_x  TODODODOOo

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

" Package Specific Option {{{
" enable deoplete (requires nvim v0.2
if has('nvim-0.2')
    let g:deoplete#enable_at_startup = 1
endif
" shortcut for tagbar
nmap <leader>tt :TagbarToggle<CR>

" fzf.vim runtime path
set rtp+=/opt/fzf
" }}}
