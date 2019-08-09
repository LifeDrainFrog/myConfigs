# myConfigs

[![build](https://travis-ci.com/LifeDrainFrog/myConfigs.svg?branch=master)](https://travis-ci.com/LifeDrainFrog/myConfigs)

Some personal configuration files

## Table Of Contents

- [vimrc](#vimrc):pencil2: 
- [bashrc](#bashrc):e-mail: 
- [gitconfig](#gitconfig):art: 

### vimrc
	 
[top](#table-of-contents)

```vim		    
" ========== Vimscript file settings ========== {{{
augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" ========== basic setup ========== {{{
" encoding
set fileencodings=utf-8,cp936
set fileencoding=utf-8
set encoding=utf-8

aug python
" ftype/python.vim overwrites this
au FileType python setlocal ts=8 sts=4 sw=8 noexpandtab
aug end

" set shell program, default is cmd

if has("windows")
	" set shell=C:\WINDOWS\System32\wsl.exe
	" set shell=\"C:\WINDOWS\System32\cmd.exe"\ -f
	" set shellpipe=|
	" set shellredir=>
	" set shellcmdflag=/c
endif


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


" display tab space enter
set list
set listchars=eol:⏎,tab:⌟.,trail:⌙,nbsp:.
" show break
set showbreak=⌞

" ctrl-a/ctrl-x as decimal number
set nrformats=

"show linenumber
set number
set relativenumber

"check filetype
filetype on

"shift indent
set tabstop=8
"set expandtab
set shiftwidth=0
" autoindent
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
set guifont=DejaVu_Sans_Mono_for_Powerline:h12:cANSI
"set guifontwide=DejaVu_Sans_Mono_for_Powerline:h16

"set fencs=utf-8

" ture color
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
set termguicolors
endif
" menu language
set langmenu=en_US.UTF-8

" chinese menu 
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" message 
"language messages en_US.utf-8 

" auto-reload working directory
" autocmd BufEnter * lcd %:p:h
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
Plugin 'kaicataldo/material.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'

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

" The following autocommand will cause the quickfix window to open after any grep invocation:
autocmd QuickFixCmdPost *grep* cwindow
" }}}

" ========== theme ========= {{{

"STATUS BAR
set laststatus=2

" set t_Co=256
" light or dark
set background=dark
colorscheme material 
" let g:material_theme_style = 'default' | 'palenight' | 'dark'
let g:material_theme_style = 'default'
let g:material_terminal_italics = 1

"vim-airline
set ambiwidth=double
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'material'

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
"autocmd BufNewFile * :write
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


inoremap jk <ESC>

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" join lines without adding spaces
nnoremap J gJ

noremap Y y$
"
nnoremap <space> dd

"
nnoremap \ x

vnoremap \ U

"inoremap <c-d> <esc>ddi
"inoremap <c-u> <esc>viwUi<esc>

" custom mapping
" nnoremap <F3> :Autoformat<CR>

" termianl shortcut
" nnoremap <leader>t :bel terminal<CR>
nnoremap <leader>t :wincmd b \| bel terminal<CR>
" NerdTree shortcut
"nnoremap nn :NERDTree %<CR>
nnoremap <leader>o :NERDTreeToggle %<CR>
nnoremap <leader>r :NERDTreeFind<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

inoremap { {}<ESC>ha<CR><CR><ESC>ka
nnoremap <F3> :%!astyle<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <leader>p :tabp<CR>
" close highlighting
nnoremap <leader>h :noh<CR>
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ip :PluginInstall<cr>
" }}}

" ========= abbreviation ========= {{{
iabbrev adn and
iabbrev waht what
iabbrev tehn then

"}}}

" ========= autoformat tool ========= {{{
autocmd BufNewFile,BufRead *.c set formatprg=astyle 
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle 

" let g:formatterpath = ['E:\Vim\AStyle\bin']
"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:autoformat_remove_trailing_spaces = 0
"let g:autoformat_verbosemode = 1
" }}}


```

### bashrc
	 
[top](#table-of-contents)

```bash		    
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
else
	color_prompt=
fi
fi

if [ "$color_prompt" = yes ]; then
#PS1='${debian_chroot:+($debian_chroot)}\n[\A]-\[\033[01;31m\]\u@\[\033[01;37m\]\h:\[\033[01;33m\][\w]\[\033[00m\]\[\033[01m\]\n>\$ \[\033[00m\]'
PS1=$'\n\xe2\x8c\x9a\A-\[\033[01;31m\]\u@\[\033[01;37m\]\h:\[\033[01;33m    \][\w]\[\033[00m\]\[\033[01m\]\n>\xe2\x9a\xa1 \[\033[00m\]'
else
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
;;
*)
;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi
# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/root/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
\eval "$__conda_setup"
else
if [ -f "/root/anaconda3/etc/profile.d/conda.sh" ]; then
. "/root/anaconda3/etc/profile.d/conda.sh"
CONDA_CHANGEPS1=false conda activate base
else
\export PATH="/root/anaconda3/bin:$PATH"
fi
fi
unset __conda_setup
# <<< conda init <<<
# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/root/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
\eval "$__conda_setup"
else
if [ -f "/root/anaconda3/etc/profile.d/conda.sh" ]; then
. "/root/anaconda3/etc/profile.d/conda.sh"
CONDA_CHANGEPS1=false conda activate base
else
\export PATH="/root/anaconda3/bin:$PATH"
fi
fi
unset __conda_setup
# <<< conda init <<<

# thefuck
eval "$(thefuck --alias wtf --enable-experimental-instant-mode)"

export SYSTEMD_EDITOR="/usr/bin/vim" 
export EDITOR=vim

eval $(thefuck --alias)

```

### gitconfig
	 
[top](#table-of-contents)

```		    
[user]
name = yourname
email = your@email.com
signingkey= yoursigningkey
[alias]
st = status
cm = commit -m
br = branch
co = checkout
df = diff
ci = commit
last = log -1 HEAD
visual = !gitk
	lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
	lg-ascii = log --graph --pretty=format:'%h -%d %s (%cr) <%an>' --abbrev-commit
	adog = log --all --decorate --oneline --graph
	alias.ls=ls-tree --full-tree --name-only -r HEAD
[commit]
	gpgsign = true
[pull]
	rebase = true
[core]
	editor=vim

```