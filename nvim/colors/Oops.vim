" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "Oops"

highlight Comment	 ctermfg=8						  guifg=#6803ff
highlight Constant	 ctermfg=14			   cterm=none guifg=#ffffff				  gui=none
highlight Identifier ctermfg=6						  guifg=#ffffff
highlight Statement  ctermfg=3			   cterm=bold guifg=#5ffdff				  gui=bold
highlight PreProc	 ctermfg=10						  guifg=#ffffff
highlight Type		 ctermfg=2						  guifg=#00f708
highlight Special	 ctermfg=12						  guifg=#1afd00
highlight Error					ctermbg=9							guibg=#c91b00
highlight Directory  ctermfg=2						  guifg=#03faff
highlight LineNr guifg=#ff8b00 guibg=NONE guisp=NONE gui=NONE ctermfg=21 ctermbg=NONE cterm=NONE
highlight StatusLine ctermfg=11 ctermbg=12 cterm=none guifg=#000000 guibg=#ffffff gui=none
highlight Normal									  guifg=#ffffff guibg=#000000
highlight Search				ctermbg=3							guibg=#00fff0
highlight Number guifg=#ff00f4 guibg=NONE guisp=NONE gui=NONE ctermfg=63 ctermbg=NONE cterm=NONE
highlight Boolean guifg=#5ffdff guibg=NONE guisp=NONE gui=NONE ctermfg=195 ctermbg=NONE cterm=NONE
highlight Operator guifg=#33ff00 guibg=NONE guisp=NONE gui=bold ctermfg=82 ctermbg=NONE cterm=bold
highlight String guifg=#fefb67 guibg=NONE guisp=NONE gui=NONE ctermfg=45 ctermbg=NONE cterm=NONE
