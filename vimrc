" Caution: Mapping should place before PluginConfigure
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autocmd BufWritePre * :normal gg=G " reindent every time write file
" get to the newest change
syntax on " turn on syntax highlighting
set nocompatible " nocompatible with vi
let mapleader = ' ' " map leader key to <Space>
nnoremap U <C-r>
" uppercase
inoremap <C-u> <Esc>vawUea
" a easier way to 'e'dit my 'v'imrc file
nnoremap <Leader>ev :tabnew ~/.config/vimrc<CR>
" source vimrc immediately
nnoremap <Leader>sv :source $MYVIMRC<CR>
noremap <silent> _ %
noremap <silent> - dd
noremap <silent> H ^
noremap <silent> L g_
noremap <silent> J 5j
noremap <silent> K 5k

" quicker window movement -- Windows are 'not' designed to offer you a view into a buffer and can not be uses as file-proxies.No more, no less.{{{
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
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

" quicker input
nnoremap <M-o> ddO
inoremap <M-o> <Esc>ddO
" auto close {
function! s:CloseBracket()
    let line = getline('.')
    if line =~# '^\s*\(struct\|class\|enum\) '
        return "{\<Enter>};\<Esc>O"
    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
        " Probably inside a function call. Close it off.
        return "{\<Enter>});\<Esc>O"
    else
        return "{\<Enter>}\<Esc>O"
    endif
endfunction

inoremap <expr> {<Enter> <SID>CloseBracket()


filetype plugin indent on " enable file type detection

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=marker " manage vimrc files
set nospell " close spell examine
set number " show line number
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
set cmdheight=1 " Better display for messages 
set updatetime=300 " You will have bad experience for disgnostic messages when it's default 4000
set shortmess+=c " don't give |ins-completion-menu| message
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
set smartindent
set smarttab
set copyindent
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab                      " switch tabs to spaces automatically
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
set statusline+=%{gutentags#statusline()} " to know when Gutentags is generating tags, it will print the String 'TAGS' in status-line when Gutentags is generating things in the background.
set wildignore+=*.aux,*.out,*.toc " LaTex
set wildignore+=*.orig " Merge files
set wildignore+=*.sw? " vim swap files
set wildignore+=.DS_Store " OSX files
set wildignore+=.git,.hg " VCS files
" set termguicolors " enable 24bit colors
set tags=./.tags;,.tags
set wildmenu " use <tab> with auto-completion in Command mode
set wildmode=longest,list,full
set visualbell


" vim-plug download confjigurations {{{
call plug#begin('~/.config/nvim/autoload')

Plug 'liuchengxu/space-vim-dark'
Plug 'wellle/targets.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/argtextobj.vim'
Plug 'preservim/nerdcommenter'
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-eunuch'
Plug 'psf/black', { 'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1' } "python fixer
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'easymotion/vim-easymotion'
Plug 'rust-lang/rust.vim' 
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'MattesGroeger/vim-bookmarks'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'mhinz/vim-startify'
Plug 'suan/vim-instant-markdown'
Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}

" color {{{
set background=dark
colorscheme Wizard
" set t_Co=256
" enable true color
if has("termguicolors")
    set termguicolors
endif
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

"NerdTree Configuration
"autocmd vimenter * NERDTree

" rust support configurations
let g:rustfmt_autosave = 1

" Leaderf {{{
let g:Lf_ShowDevIcons = 1
let g:Lf_DevIconsFont = "DejaVuSansMono Nerd Font Mono"
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {'Function':1, 'Colorscheme':1}
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

" rg(ripgrep) built in Leaderf config
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--glob=!git/*",
        \ "--hidden"
    \ ]
noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.h -g *.cpp -g *.c", expand("<cword>"))<CR><CR>


let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git'] " I have no idea what it's saying
let g:Lf_WorkingDirectoryMode = 'Ac' " I have no idea what it's doing
let g:Lf_CacheDirectory = expand('~/.config/nvim/cache')

" }}}

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
\   'c'         : ['cquery'],
\   'cpp'       : ['cquery'],
\}
" }}}

" black--python fixer
let g:black_linelength = 79 " flake8 line length

" run black on save
autocmd BufWritePre *.py execute ':Black' 

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" add fake vim-textobj-function with target.vim
nmap cif o<Esc>cib
nmap dif o<Esc>dib
nmap caf o<Esc>cab<Esc>cc
nmap daf o<Esc>dab<Esc>cc<Esc>

" coc.nvim {{{
" use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.
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

" }}}

" Gtags
" 告诉 gtags 默认 C/C++/Java 等六种原生支持的代码直接使用 gtags 本地分析器，而其他语言使用 pygments 模块
let $GTAGSLABEL = 'native-pygments'
" 必须设置，否则会找不到native-pygments和language map的定义
let $GTAGSCONF = '~/.globalrc'

" Gutentags {{{

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', 'Makefile']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" }}}
