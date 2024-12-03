set nocompatible
set noerrorbells
set number
set relativenumber

" Clipboard settings to allow copy and paste
set clipboard=unnamedplus
set encoding=utf8

" Open Splits in an more natural way
set splitbelow
set splitright

set incsearch
set smartindent
set tabstop=4 
set shiftwidth=4
set expandtab

" Create undofile for undoing
set undodir=~/.vim/undodir
set undofile

" Set language to german
set spelllang=de_de

set scrolloff=4
set nowrap

" Needed to prevent tmux from fucking up colors
set term=screen-256color

set path+=**
set wildmenu
set wildmode=longest:full,full
" set hidden
set updatetime=50
set guifont=DejaVuSansMono "needed for gvim/airline
set colorcolumn=80
set ttimeoutlen=0
set mouse=a "enable mouse
set ttymouse=sgr "workaround to make mouse work in terminal

" Autocommands
" Switch between relative numbers and normal numbers when entering Command Mode
autocmd CmdlineEnter * :set norelativenumber | redraw
autocmd CmdlineLeave * :set relativenumber

" Plugins
syntax on
filetype plugin on

" File Browsing
let g:netrw_banner=0
" let g:netrw_altv=1
let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_liststyle=3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

set background=light
