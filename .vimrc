"
" .vimrc
" Vim configuration file
" Reed Sorensen
" rsoren@uw.edu
"


""""""""""""""""""""""""""""""""""""""""
" Vundle plug-in manager
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible
filetype off


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" load plug-ins
Plugin 'gmarik/Vundle.vim' "required
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'jpalardy/vim-slime'
Plugin 'kien/ctrlp.vim'


" finish
call vundle#end()
filetype plugin indent on


" some useful commands
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins
" " see :h vundle for more details or wiki for FAQ




""""""""""""""""""""""""""""""
"" COLORS AND FORMATTING

set t_Co=256

colorscheme jellybeans


" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax enable
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing




""""""""""""""""""""""""""""""
"" PREFERENCES

"
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %



" Better copy & paste -- press F2 before pasting large code blocks
set pastetoggle=<F2>
set clipboard=unnamed


" Rebind <Leader> key
let mapleader = ","


" Bind nohl
" ``Ctrl+n`` removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Move code blocks horizontally
" Visual select a block of code, then use ``>`` and ``<``
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Turn off warning bell and flash
set noerrorbells visualbell t_vb=


" No delay after escape
set timeoutlen=1000 ttimeoutlen=0


" Replace tabs with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable backup and swap files - they trigger too many events
set nobackup
set nowritebackup
set noswapfile


" Other useful settings
set history=700
set undolevels=700




""""""""""""""""""""""""""""""
"" PLUG-IN SETTINGS


" Settings for airline
set laststatus=2
let g:airline_theme = 'powerlineish'



" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*



" Settings for vim-slime
let g:slime_target = "screen"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_no_mappings = 1

vmap <C-j> <Plug>SlimeRegionSend '>j
nmap <C-j> <Plug>SlimeLineSend 0j
imap <C-j> <Esc><Plug>SlimeLineSend 0j




""""""""""""""""""""""""""""""
"" OTHER CONFIG STEPS


" Fix colors in GNU Screen and remove vim-slime delay
" Add the following lines to ~/.screenrc
"
" attrcolor b ".I"
" defbce "on"
" termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'
" term xterm-256color
"
" msgwait 0
"


" Steps to set up workflow on the cluster
" 1. PuTTY --> login --> screen --> vim (with vim-slime plugin)
" 2. Putty (#2) --> login --> screen -S interp --> open an interpreter
" 3. In Vim, select code and do ^C^C to send code to the interpreter
"    -- Session name is 'interp'
"    -- Window name is '0' (default)
"




