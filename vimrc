" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" basic setup {{{
" Encoding
set encoding=utf-8
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
" syntax highlighting
syntax on
" Better command-line completion
set wildmenu
" show line number
set number
" highlight searchs
set hlsearch
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" show partial commands in the last line of the screen
set showcmd

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" highlight current line
set cursorline

" status bar
set laststatus=2
set statusline=%.20F
"set statusline=%f         " Path to the file
set statusline+=\ -\      " Separator
set statusline+=FileType: " Label
set statusline+=%y        " Filetype of the file
set statusline+=%=        " Switch to the right side
set statusline+=Current:\ %-4l    " Current line
set statusline+=/    " Separator
set statusline+=Total:\ %-4L   " Total lines 
" auto source
autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd BufNewFile *:write
" }}}

" map-key {{{
" leader
let mapleader = "-"

" local leader
let maplocalleader = ","

" insert mode
inoremap <esc> <nop>

inoremap jk <esc>
inoremap <c-d> <esc>ddo
inoremap <c-u> <esc>vbUwa

" normal mode
nnoremap <space> dd
nnoremap Y y$
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" move between long wrapped lines
nnoremap k gk
nnoremap j gj

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" }}}

