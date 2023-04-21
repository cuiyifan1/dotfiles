set nocompatible " nocompatible with vi
let mapleader = ' ' " map leader key to <Space>
let maplocalleader = '\'
filetype plugin indent on " enable file type detection

" vim-plug download confjigurations {{{
call plug#begin('~/.config/nvim/autoload')

Plug 'ajmwagar/vim-deus'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vifm/vifm.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'wellle/targets.vim' " add various text objects
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'haya14busa/incsearch.vim'
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jez/vim-better-sml'
Plug 'cmugpi/vim-c0'

call plug#end()
" }}}

" colorscheme {{{
syntax enable
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme deus
let g:deus_termcolors=256
" }}}

" key-mapping {{{
nnoremap X dd
nnoremap U <C-r>
nnoremap <Leader>ev :e ~/.config/vimrc<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>:e<CR>
noremap <silent> <M-y> <Esc>:%y<CR>
noremap <silent> <M-[> :noh<CR>
" }}}

" quicker cursor movement -- Windows are 'not' designed to offer you a view into a buffer and can not be uses as file-proxies.No more, no less.{{{
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <M-s> <C-w>s
noremap <M-v> <C-w>v
" }}}

" buffers -- Buffers are vim's file-proxies. If you think in terms of file, you think in terms of buffers, which is used in situation that one for editing and one for referencing.{{{
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
" close the current buffer and move to next one
map Q :bdelete\|:bnext<CR>
" }}}

" basic-settings {{{
set cursorline
set ttimeoutlen=100 " fix the delay between normal mode and insert mode in tmux
set sj=1 " half page scrolling in vim
set foldmethod=marker " manage vimrc files
set nospell " close spell examine
set number " display line number
set numberwidth=1
set relativenumber " show relative line number
set hlsearch " highlight all search result
set incsearch " show incremental search results as you type
set encoding=utf-8
set linespace=0 " No extra spaces between rows
set confirm " Confirm before vim exit
set lazyredraw " don't update the display while executing macros
set nomodeline " disable mode lines (security measure)
set noshowmode " do not show Insert, We already have it in lightline
set mouse=a " allow mouse select and etc operation
set noswapfile " disable swap file
set cmdheight=2 " Better display for messages 
set updatetime=200 " You will have bad experience for disgnostic messages when it's default 4000
set signcolumn=yes " always show signcolumns otherwise it would shift the text each time diagnostics appear/become resolved.
set noautochdir " change dirs automatically
set noerrorbells " No sound
set novisualbell " No bell too
set backspace=eol,start,indent " use backspace for delete space line
set ignorecase " do case insensitive search
set smartcase " Overrides ignore when captial exists
set showmatch " Show matching brackets/parenthesis
set ruler " show the cursor's position
set history=1000 " save 1000 cmd
set timeoutlen=1000 " time in milliseconds to wait for a mapped sequence to complete
set clipboard+=unnamedplus " use the clipboard for all operations

" Editor {{{
set autoindent                                   
set smartindent
set smarttab
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab " switch tabs to spaces automatically
" }}}

set autoread
set autowrite
set autowriteall " Auto-write all file changes
set laststatus=2 " show status line
" set showtabline=2
set hidden " make it possible to switch to another buffer when current buffer is not writed and abandoned
set display+=lastline
set showcmd                                                            
set modifiable
set nobackup
set nowritebackup
set splitbelow
set splitright
" }}}

" Leaderf {{{
let g:Lf_ShowDevIcons = 1
noremap <Leader>fm :LeaderfMru<CR>
noremap <Leader>fu :LeaderfFunction<CR>
noremap <Leader>fw :LeaderfWindow<CR>
noremap <Leader>fb :LeaderfBuffer<CR>
noremap <Leader>fl :LeaderfLine<CR>
noremap <Leader>ff :LeaderfFile<CR>
noremap <Leader>fg :Leaderf gtags<CR>
noremap <Leader>fr :Leaderf rg<CR>
let g:Lf_NormalMap = {
            \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
            \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
            \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
            \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
            \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
            \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
            \}
" Leaderf Gtags
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_RootMarkers = ['.git']
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_CacheDirectory = expand('~/.config/nvim/cache')
noremap <leader>gr :<C-U><C-R>=printf("Leaderf gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>gd :<C-U><C-R>=printf("Leaderf gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>go :<C-U><C-R>=printf("Leaderf gtags --recall %s", "")<CR><CR>
noremap <leader>gn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>gp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
" rg built in Leaderf config
let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--glob=!git/*",
        \ "--hidden"
    \ ]
" }}}

" easy-motion {{{
nmap mo <Plug>(easymotion-s2)
" }}}

" markdown preview for nvim {{{
let g:mkdp_auto_start = 1 " open the window after entering markdown buffer
let g:mkdp_auto_close = 1 " the vim will refresh markdown when save the buffer or leave from insert mode, default 0 is auto refresh markdown as you edit or move the cursor
let g:mkdp_refresh_slow = 1
let g:mkdp_browser = ''
" }}}

" nerdtree {{{
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR> 
" }}}

" syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': []
\}
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
nnoremap <Leader>sc :SyntasticCheck<CR> " make a syntax check
nnoremap <Leader>sr :SyntasticReset<CR> " turn off the error notifiers
nnoremap <Leader>si :SyntasticInfo<CR>
nnoremap <Leader>st :SyntasticToggleMode<CR> " switch between passive mode and active mode
" }}}

" incsearch {{{
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
" }}}

" competitive programming {{{
" }}}

" terminal mode :h terminal-emulator {{{
tnoremap <Esc> <C-\><C-n>
" }}}

" airline theme {{{
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
" }}}

" vim-better-sml {{{
augroup vimbettersml
  au!

  " ----- Keybindings -----

  au FileType sml nnoremap <silent> <buffer> <leader>t :SMLTypeQuery<CR>
  au FileType sml nnoremap <silent> <buffer> gd :SMLJumpToDef<CR>

  " open the REPL terminal buffer
  au FileType sml nnoremap <silent> <buffer> <leader>is :SMLReplStart<CR>
  " close the REPL (mnemonic: k -> kill)
  au FileType sml nnoremap <silent> <buffer> <leader>ik :SMLReplStop<CR>
  " build the project (using CM if possible)
  au FileType sml nnoremap <silent> <buffer> <leader>ib :SMLReplBuild<CR>
  " for opening a structure, not a file
  au FileType sml nnoremap <silent> <buffer> <leader>io :SMLReplOpen<CR>
  " use the current file into the REPL (even if using CM)
  au FileType sml nnoremap <silent> <buffer> <leader>iu :SMLReplUse<CR>
  " clear the REPL screen
  au FileType sml nnoremap <silent> <buffer> <leader>ic :SMLReplClear<CR>
  " set the print depth to 100
  au FileType sml nnoremap <silent> <buffer> <leader>ip :SMLReplPrintDepth<CR>

  " ----- Other settings -----

  " Uncomment to try out conceal characters
  au FileType sml setlocal conceallevel=2

  " Uncomment to try out same-width conceal characters
  let g:sml_greek_tyvar_show_tick = 1
augroup END
" }}}

" coc-nvim {{{

" }}}
