"---------------------------------------------------------
" First load plugins
" Set basic non plugin specific settings
" Set plugin specific settings
"---------------------------------------------------------

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

" Command-line fuzzy finder from: https://github.com/junegunn/fzf
Plug 'junegunn/fzf' , { 'do': { -> fzf#install() } }

" Commenting shortcuts from: https://github.com/preservim/nerdcommenter
Plug 'preservim/nerdcommenter'

call plug#end()

"---------------------------------------------------------
" Basic global settings

set background=light

set number
syntax enable
colorscheme torte

set wildmenu
set wildmode=list:longest,full

set nowrap
set showcmd

set splitbelow
set splitright

set notimeout
set ttimeout

set smarttab
set expandtab

set scrolloff=10
set sidescrolloff=5

" Show matching brackets
set showmatch

" Show when line too long in Fortran
highlight OverLengthHL ctermbg=238 guibg=#dfffff 
augroup overLengthaugrp
    autocmd!
    autocmd FileType fortran  let w:m3=matchadd('OverLengthHL', '\%73v.\+', -1)
augroup END

"---------------------------------------------------------
