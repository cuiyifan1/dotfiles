" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

set nocompatible
set showmatch
syntax on 
colorscheme Wizard

" file type detection
filetype plugin indent on
set autoindent

set t_Co=256
set showcmd
set showmode
set ruler
set background=dark
set encoding=utf-8

" use four spaces instead of tabs during formatting
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" open statusline
set laststatus=2

if has('nvim') || has('termguicolors')
  set termguicolors
endif

" quicker noremal mode movement
noremap <silent> H ^
noremap <silent> J 5j
noremap <silent> K 5k
noremap <silent> L g_
noremap <silent> W 5w
noremap <silent> E 5e
noremap <silent> B 5b

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


"vim-plug download configurations
call plug#begin('~/.config/nvim/autoload')

Plug 'rust-lang/rust.vim' " rust support in vim
Plug 'itchyny/lightline.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'MattesGroeger/vim-bookmarks'
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 

call plug#end()

"nerdcommenter configurations--添加注释
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

"NerdTree Configuration
"autocmd vimenter * NERDTree

"Challenger_deep status line
let g:lightline = { 'colorscheme': 'challenger_deep'}

"Fuzzy Finder(AKA fzf)
set rtp+=/usr/local/opt/fzf

" rust support configurations
let g:rustfmt_autosave = 1
