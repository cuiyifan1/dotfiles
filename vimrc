""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " nocompatible with vi
let mapleader = ' ' " map leader key to <Space>

" vim-plug download confjigurations {{{
call plug#begin('~/.config/nvim/autoload')

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'wellle/targets.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/argtextobj.vim'
Plug 'tpope/vim-eunuch'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'

call plug#end()
" }}}

" color {{{
set background=dark
syntax on " turn on syntax highlighting
colorscheme Wizard
if has("termguicolors")
    set termguicolors
endif
" }}}

nnoremap U <C-r>
" uppercase
inoremap <C-u> <Esc>vawUea
" a easier way to 'e'dit my 'v'imrc file
nnoremap <Leader>ev :tabnew ~/.config/vimrc<CR>
" source vimrc immediately
nnoremap <Leader>sv :source $MYVIMRC<CR>
noremap <silent> = %
noremap <silent> X dd

" Emacs key bindding in vim(only insert mode) 
" Emacs(insert mode) + vim(noremal mode/visual mode) = Best Editor
inoremap <C-P> <Up>
inoremap <C-N> <Down>
inoremap <C-J> <C-N>
inoremap <C-K> <C-P>
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-B> <Left>
inoremap <C-F> <Right>

" quicker window movement -- Windows are 'not' designed to offer you a view into a buffer and can not be uses as file-proxies.No more, no less.{{{
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <M-h> zt
noremap <M-m> zz
noremap <M-l> zb
" }}}

" buffers -- Buffers are vim's file-proxies. If you think in terms of file, you think in terms of buffers, which is used in situation that one for editing and one for referencing.{{{
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
" close the current buffer and move to next one
map Q :bdelete\|:bnext<CR>
" }}}

" tab settings -- tab page are designed to contain one or more windows and contain buffers, which is often used on the separate part of the project and without messing with their current view.{{{
noremap <M-n> :tabn<CR>
noremap <M-p> :tabp<CR>
" open a new tab with an empty buffer like ':tabnew filename'
noremap <M-t> :tabnew
" // move the tabs to a specific spot with command ':tabm <tabPosition>', if
" // don't give the command an <tabPosition> argument, then the current tab will
" // be moved to the last spot
" noremap tm :tabm
" // open the content of current buffer in a new tab page
" noremap ts :tab split<CR>
"
" // :tabdo %s/foo/bar/g -- replace foo with bar in files in all tabs
" // or run through each open tab and run the search and replace
" // command(%s/foo/bar/g) in each
" // one
"
" :tabc -- close current tab
" :tabo -- close all other tabs leaving ONLY the current tab open
" }}}

filetype plugin indent on " enable file type detection

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=marker " manage vimrc files
set nospell " close spell examine
set number " show line number
set numberwidth=1
set relativenumber " show relative line number
set hlsearch " highlight the search part
set incsearch " show the matching part while typing
set encoding=utf-8 " configure the encoding
set termencoding=utf-8 " it will choose the first right configure to use
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
set fileformats=unix,dos,mac
set linespace=0 " No extra spaces between rows
set confirm " Confirm before vim exit
set lazyredraw " don't update the display while executing macros
set nomodeline " disable mode lines (security measure)
set noshowmode " do not show Insert, We already have it in lightline
set mouse=a " allow mouse select and etc operation
set noswapfile " no swap files
set nobackup " some lsp servers have issues with backup files, see coc.nvim #649
set nowritebackup
set cmdheight=2 " Better display for messages 
set updatetime=200 " You will have bad experience for disgnostic messages when it's default 4000
set shortmess+=c
set signcolumn=yes " always show signcolumns otherwise it would shift the text each time diagnostics appear/become resolved.
set noautochdir " do not change dirs automatically
set noerrorbells " No sound
set backspace=eol,start,indent " use backspace for delete space line
set ignorecase " 当输出大写字母时，区分大小写  
set smartcase " Overrides ignore when captial exists
set showmatch " Show matching brackets/parenthesis
set ruler " show the cursor's position
set history=1000 " save 1000 cmd
set timeoutlen=1000 " time in milliseconds to wait for a mapped sequence to complete

" Editor {{{
set autoindent                                   
" set paste
set smartindent
set smarttab
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab " switch tabs to spaces automatically
" }}}

set autoread
set autowrite
set autowriteall " Auto-write all file changes
set laststatus=2 " show status line
set showtabline=2
set hidden " make it possible to switch to another buffer when current buffer is not writed and abandoned
set display+=lastline
set showcmd                                                            
set statusline+=%*
set statusline+=%#warningmsg#
set wildignore+=*.aux,*.out,*.toc " LaTex
set wildignore+=*.orig " Merge files
set wildignore+=*.sw? " vim swap files
set wildignore+=.DS_Store " OSX files
set wildignore+=.git,.hg " VCS files
set tags=./.tags;,.tags
set wildmenu " use <tab> with auto-completion in Command mode
set wildmode=longest,list,full
set visualbell
" set virtualedit=all " allow cursor to be positioned where there is no actual characters
set modifiable
set clipboard+=unnamedplus " use clipboard with all operations instead of using registers like '+' or '*"

" nerdcommenter configurations--添加注释 {{{
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
" }}}

" Leaderf {{{
let g:Lf_ShowDevIcons = 1
" let g:Lf_DevIconsFont = 'DejaVuSansMono Nerd Font Mono'
noremap <Leader>fp :LeaderfFile ..<CR>
noremap <Leader>fm :LeaderfMru<CR>
noremap <Leader>fu :LeaderfFunction<CR>
noremap <Leader>fw :LeaderfWindow<CR>
noremap <Leader>fb :LeaderfBuffer<CR>
noremap <Leader>fc :LeaderfColorscheme<CR>
noremap <Leader>fl :LeaderfLine<CR>
noremap <Leader>ff :LeaderfFile<CR>
noremap <Leader>fr :Leaderf rg<CR>
noremap <Leader>fg :Leaderf gtags<CR>
let g:Lf_NormalMap = {
            \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
            \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
            \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
            \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
            \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
            \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
            \}
" rg built in Leaderf config
let g:Lf_GtagsAutoGenerate = 1 " auto generate gtags 
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--glob=!git/*",
        \ "--hidden"
    \ ]
noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.h -g *.cpp -g *.c", expand("<cword>"))<CR><CR>
let g:Lf_CacheDirectory = expand('~/.config/nvim/cache')
" }}}

" easy-motion
nmap mo <Plug>(easymotion-s2)

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" coc.nvim {{{
" clangd(llvm) with coc-clangd as language server instead of ccls which is
" hard to use!
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <m-space> to trigger completion.
inoremap <silent><expr> <m-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Diagnositcs(also :CocDiagnositcs)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> \g :CocDiagnostics<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}

" markdown preview for nvim {{{
let g:mkdp_auto_start = 1 " open the window after entering markdown buffer
let g:mkdp_auto_close = 1 " the vim will refresh markdown when save the buffer or leave from insert mode, default 0 is auto refresh markdown as you edit or move the cursor
let g:mkdp_refresh_slow = 1
let g:mkdp_browser = ''
" }}}

" black(python code linter)
let g:black_linelength = 79
