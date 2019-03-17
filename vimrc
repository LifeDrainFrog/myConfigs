" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" vundle {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdcommenter' 
Plugin 'scrooloose/nerdtree' 
Plugin 'majutsushi/tagbar' 
Plugin 'honza/vim-snippets' 
Plugin 'vim-airline/vim-airline'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" theme {{{
set background=dark
colorscheme solarized

"airline Settings
let laststatus =2
let g:airline_powerline_fonts = 1
let g:airline_theme= "dark"

" }}}

" basic setup {{{
"set message language  
let $LANG = 'en'  

"set menu's language of gvim. no spaces beside '='  
set langmenu=en   

set termencoding=utf-8

set fileencoding=utf-8

set fileencodings=ucs-bom,utf-8,chinese,cp936

set guifont=Consolas:h12

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
" set cursorline

" status bar
"set laststatus=2
"set statusline=%.20F
"set statusline=%f         " Path to the file
"set statusline+=\ -\      " Separator
"set statusline+=FileType: " Label
"set statusline+=%y        " Filetype of the file
"set statusline+=%=        " Switch to the right side
"set statusline+=Current:\ %-4l    " Current line
"set statusline+=/    " Separator
"set statusline+=Total:\ %-4L   " Total lines 

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
nnoremap <leader>ip :PluginInstall<cr>
" move between long wrapped lines
nnoremap k gk
nnoremap j gj

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" }}}

