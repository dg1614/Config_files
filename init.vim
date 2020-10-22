"---------------------------------------------------------
" First load plugins
" Set basic non plugin specific settings
" Set plugin specific settings
"---------------------------------------------------------

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

" Command-line fuzzy finder from: https://github.com/junegunn/fzf
Plug 'junegunn/fzf' , { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"" Commenting shortcuts from: https://github.com/preservim/nerdcommenter
"Plug 'preservim/nerdcommenter'

call plug#end()

"---------------------------------------------------------
" Basic global settings

set background=light

set number
syntax enable
colorscheme morning

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
set ignorecase
set smartcase

" Show when line too long in Fortran
highlight OverLengthHL ctermbg=238 guibg=#dfffff 
augroup overLengthaugrp
    autocmd!
    autocmd FileType fortran  let w:m3=matchadd('OverLengthHL', '\%73v.\+', -1)
augroup END

"---------------------------------------------------------
" Fzf settings

" Preview window position and size
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Rg searches in non-git folders too
command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   "rg -u --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, 
        \   fzf#vim#with_preview(), <bang>0)

noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-a> :Files~<CR>

noremap <C-f> :Rg! 

"---------------------------------------------------------
