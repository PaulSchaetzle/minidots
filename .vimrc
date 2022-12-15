" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
" let skip_defaults_vim=1
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
set wildoptions=pum
" set hidden
set updatetime=50
set guifont=DejaVuSansMono "needed for gvim/airline
set colorcolumn=80
set ttimeoutlen=0
set mouse=a "enable mouse
set ttymouse=sgr "workaround to make mouse work in terminal

syntax on
filetype plugin on

" Autocommands
" Switch between relative numbers and normal numbers when entering Command Mode
autocmd CmdlineEnter * :set norelativenumber | redraw
autocmd CmdlineLeave * :set relativenumber

" File Browsing
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3

set background=light
