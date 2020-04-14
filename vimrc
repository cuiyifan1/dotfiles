" Caution: Mapping should place before PluginConfigure
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"autocmd BufWritePre * :normal gg=G " reindent every time write file
" get to the newest change
nnoremap U <C-r>
" uppercase
inoremap <C-u> <Esc>vawUea
" a easier way to 'e'dit my 'v'imrc file
nnoremap <Leader>ev :sp ~/.config/vimrc<CR>
" source vimrc immediately
nnoremap <Leader>sv :source $MYVIMRC<CR>
noremap <silent> _ %
noremap <silent> - dd
noremap <silent> H ^
noremap <silent> L g_
noremap <silent> J 5j
noremap <silent> K 5k
" quicker window movement
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
" tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                                                        " nocompatible with vi
set foldmethod=marker                                                   " manage vimrc files
set nospell                                                             " close spell examine
set number                                                              " show line number
set relativenumber                                                      " show relative line number
set hlsearch                                                            " highlight the search part
set incsearch                                                           " show the matching part while typing
set encoding=utf-8                                                      " configure the encoding
set termencoding=utf-8                                                  " it will choose the first right configure to use
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
set fileformats=unix,dos,mac
set linespace=0                                                         " No extra spaces between rows
set confirm                                                             " Confirm before vim exit
set lazyredraw                                                          " don't update the display while executing macros
set nomodeline                                                          " disable mode lines (security measure)
set noshowmode                                                          " do not show Insert, We already have it in lightline
" set mouse=a                                                             " allow mouse select and etc operation
set noswapfile                                                          " no swap files
set nobackup
set noautochdir                                                         " do not change dirs automatically
set noerrorbells                                                        " No sound
set backspace=eol,start,indent                                          " use backspace for delete space line
set ignorecase                                                          " 当输出大写字母时，区分大小写  
set smartcase                                                           " Overrides ignore when captial exists
set showmatch                                                           " Show matching brackets/parenthesis
set ruler                                                               " show the cursor's position
set history=1000                                                        " save 1000 cmd
set timeoutlen=500                                                      " give u 500 time to react for cmd
set background=dark

" Editor {{{
set autoindent                                   
set smartindent
set smarttab
set copyindent
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab                      " switch tabs to spaces automatically
" }}}

set autoread
set autowrite
set autowriteall                                                        " Auto-write all file changes
set laststatus=2                                                        " show status line
set showtabline=2
set t_Co=256                                                            " number of colors
set hidden                                                              " make buffers hidden then abandoned
set display+=lastline
set showcmd                                                            
set statusline+=%*
set statusline+=%#warningmsg#
set wildignore+=*.aux,*.out,*.toc                                       " LaTex
set wildignore+=*.orig                                                  " Merge files
set wildignore+=*.sw?                                                   " vim swap files
set wildignore+=.DS_Store                                               " OSX files
set wildignore+=.git,.hg                                                " VCS files
set termguicolors                                                       " enable 24bit colors

syntax enable

filetype indent on
filetype plugin on
filetype plugin indent on " 自动补全

" vim-plug download configurations {{{
call plug#begin('~/.config/nvim/autoload')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdcommenter'
Plug 'liuchengxu/vista.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-eunuch'
Plug 'psf/black', { 'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1' } "python fixer
Plug 'Yggdroot/LeaderF'
Plug 'easymotion/vim-easymotion'
Plug 'rust-lang/rust.vim' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'MattesGroeger/vim-bookmarks'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}

colorscheme dracula

" nerdcommenter configurations--添加注释 {{{
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
" }}}

"NerdTree Configuration
"autocmd vimenter * NERDTree

" rust support configurations
let g:rustfmt_autosave = 1

" Leaderf {{{
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {'Function':1, 'Colorscheme':1}
noremap <Leader>fm :LeaderfMru<CR>
noremap <Leader>fu :LeaderfFunction<CR>
noremap <Leader>fw :LeaderfWindow<CR>
noremap <Leader>fb :LeaderfBuffer<CR>
noremap <Leader>fc :LeaderfColorscheme<CR>
noremap <Leader>fl :LeaderfLine<CR>
noremap <Leader>ff :LeaderfFile<CR>
noremap <Leader>fr :Leaderf rg<CR>
let g:Lf_NormalMap = {
            \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
            \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
            \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
            \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
            \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
            \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
            \}
" }}}

"gtags
let $GTAGSLABEL = 'native-pygments' " C/C++/Java使用本地分析器，其他语言使用pygments模块
let $GTAGSCONF = '~/.globalrc'

" easy-motion
nmap mo <Plug>(easymotion-s2)

" ale {{{
let g:ale_fix_on_save = 1 " auto fix files when files saved
let g:ale_linters_explicit = 1 " use the specified linter
" specify the format of echoed messages
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\   'python'    : ['flake8', 'pylint'],
\   'c'         : ['clang', 'cppcheck'],
\   'cpp'       : ['clang', 'cppcheck'],
\}
" }}}

" black--python fixer
let g:black_linelength = 79 " flake8 line length

" run black on save
autocmd BufWritePre *.py execute ':Black' 

" vim-airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 1

" Coc-explorer
noremap <Leader>ce :CocCommand explorer<CR>
