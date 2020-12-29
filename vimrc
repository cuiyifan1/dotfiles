" Autoload for the first time use
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


set nocompatible " nocompatible with vi
let mapleader = ' ' " map leader key to <Space>
filetype plugin indent on " enable file type detection

" vim-plug download confjigurations {{{
call plug#begin('~/.config/nvim/autoload')

Plug 'ajmwagar/vim-deus'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'wellle/targets.vim' " add various text objects
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons' " icons
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'haya14busa/incsearch.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'lervag/vimtex'

call plug#end()
" }}}

" colorscheme {{{
syntax on
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme deus
set background=dark    " Setting dark mode
let g:deus_termcolors=256
" }}}

" key-mapping {{{
nnoremap X dd
nnoremap <Leader>ev :e ~/.config/vimrc<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>:e<CR>
noremap <silent> <M-y> <Esc>:%y<CR>
noremap <silent> <M-[> :noh<CR>
" }}}

" quicker cursor movement -- Windows are 'not' designed to offer you a view into a buffer and can not be uses as file-proxies.No more, no less.{{{
noremap <silent> J 5+
noremap <silent> K 5-
noremap <C-c> <C-w>c
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
set ttimeoutlen=100 " fix the delay between normal mode and insert mode in tmux
set sj=1 " half page scrolling in vim
set magic
set foldmethod=marker " manage vimrc files
set nospell " close spell examine
set number " display line number
set numberwidth=1
set relativenumber " show relative line number
set hlsearch " highlight all search result
set incsearch " show incremental search results as you type
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
set noswapfile " disable swap file
set cmdheight=2 " Better display for messages 
set updatetime=200 " You will have bad experience for disgnostic messages when it's default 4000
set shortmess=
set signcolumn=yes " always show signcolumns otherwise it would shift the text each time diagnostics appear/become resolved.
set cursorline
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
set showtabline=2
set hidden " make it possible to switch to another buffer when current buffer is not writed and abandoned
set display+=lastline
set showcmd                                                            
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%)
set wildignore+=*.aux,*.out,*.toc " LaTex
set wildignore+=*.orig " Merge files
set wildignore+=*.sw? " vim swap files
set wildignore+=.DS_Store " OSX files
set wildignore+=.git,.hg " VCS files
set tags=./.tags;,.tags
set wildmenu " use <tab> with auto-completion in Command mode
set wildmode=longest,list,full
set modifiable
set clipboard+=unnamedplus " use clipboard with all operations instead of using registers like '+' or '*"
set nobackup
set nowritebackup
" }}}

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
nmap \ <Plug>(easymotion-s2)
" }}}

" markdown preview for nvim {{{
let g:mkdp_auto_start = 1 " open the window after entering markdown buffer
let g:mkdp_auto_close = 1 " the vim will refresh markdown when save the buffer or leave from insert mode, default 0 is auto refresh markdown as you edit or move the cursor
let g:mkdp_refresh_slow = 1
let g:mkdp_browser = ''
" }}}

" black(python code linter) {{{
let g:black_linelength = 79
" }}}

" vim-airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
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
nnoremap <Leader>sc :SyntasticCheck<CR> " make a syntax check
nnoremap <Leader>sr :SyntasticReset<CR> " turn off the error notifiers
nnoremap <Leader>si :SyntasticInfo<CR>
nnoremap <Leader>st :SyntasticToggleMode<CR> " switch between passive mode and active mode
" }}}

" incsearch {{{
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
" }}}

" nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "rust" },
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
    use_languagetree = false, -- Use this to enable language injection (this is very unstable)
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF
" }}}

" competitive programming {{{
" }}}

" terminal mode :h terminal-emulator {{{
tnoremap <Esc> <C-\><C-n>
" }}}
