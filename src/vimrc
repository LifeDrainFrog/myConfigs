" ========== Vimscript file settings ========== {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" ========== basic setup ========== {{{

"behave mswin
"source $VIMRUNTIME/vimrc_example.vim

set nocompatible              " be iMproved, required
"syntax highlighting
syntax on

"close sounds on erros
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" ctrl-a/ctrl-x
set nrformats=

"show linenumber
set number
set relativenumber

"check filetype
filetype on

"autoindent
set autoindent

"smartindent
set smartindent

"show match 
set showmatch

"show command line
set showcmd
"set cmdheight=2

" Better command-line completion
set wildmenu

"close backup
"set nobackup

"show cursor location
set ruler

" current line highlighting
set cursorline

" highlight searchs
set hlsearch
set incsearch

"set gui font for high resolutions
set guifont=DejaVu_Sans_Mono_for_Powerline:h16:b:cDEFAULT
set guifontwide=DejaVu_Sans_Mono_for_Powerline:h16

" encoding
set fileencodings=utf-8,cp936
set fileencoding=utf-8
set encoding=utf-8
"set fencs=utf-8

" menu language
set langmenu=en_US.UTF-8
 
" chinese menu 
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
" message 
"language messages en_US.utf-8 

" auto-reload working directory
autocmd BufEnter * lcd %:p:h
"}}}

" ========== Vundle ========== {{{
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=E:/Vim/vimfiles/bundle/Vundle.vim
call vundle#begin('E:/Vim/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'

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

" ========== theme ========= {{{

"STATUS BAR
set laststatus=2

set t_Co=256
colorscheme Solarized
" light or dark
set background=light

"vim-airline
set ambiwidth=double
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "deus"

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

"}}}

" ========== automation ========== {{{
" automatically source $MYVIMRC
autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd BufNewFile * :write
" auto-format html
autocmd BufWritePre *.html :normal gg=G
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType c iabbrev <buffer> rtt return 
" }}}

" ========== key mapping ========== {{{

let mapleader = "-"
let maplocalleader = "\\"

nnoremap <leader><C-o>:NERDTreeToggle %<CR>
nnoremap <leader>r :NERDTreeFind<cr>

inoremap jk <ESC>
inoremap <esc> <nop>

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" nnoremap <TAB> :%!astyle<CR>

noremap Y y$
"
nnoremap <leader>dd O<esc>jddk
"
nnoremap <space> dd

"
nnoremap \ x

vnoremap \ U

inoremap <c-d> <esc>ddi
inoremap <c-u> <esc>viwUi<esc>

" custom mapping
nnoremap <F3> :Autoformat<CR>
nnoremap <leader>d dw
nnoremap <leader>h :noh<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ip :PluginInstall<cr>

nnoremap <leader>c ^I//<esc><Space>
nnoremap <c-_> ^I//<esc>

" }}}

" ========= abbreviation ========= {{{
iabbrev adn and
iabbrev waht what
iabbrev tehn then

"}}}

" ========= autoformat tool ========= {{{
"autocmd BufNewFile,BufRead *.c set formatprg=astyle 
"autocmd BufNewFile,BufRead *.cpp set formatprg=astyle 


" let g:formatterpath = ['path\to\formatter\bin']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:autoformat_verbosemode = 1
" }}}

