# configuration file
some personal configurations:book:

## Table of Contents
1. [vimrc](#vimrc) :pencil2:
2. [bashrc](#bashrc) :art:
3. [gitconfig](#gitconfig) :e-mail:

## vimrc
[top](#table-of-contents)
```vim
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

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'kaicataldo/material.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
colorscheme material
let g:material_theme_style = 'dark' 
"default | 'palenight' | 'dark'
let g:material_terminal_italics = 1
let g:airline_theme = 'material'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:lightline = { 'colorscheme': 'material_vim' }
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
```

## bashrc
[top](#table-of-contents)
```shell
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
## gitconfig
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
[core]
autocrlf = input
editor = vim
[commit]
gpgsign = true
[push]
default = simple
```
