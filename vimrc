" Author: Quinn Strahl

" [Plugins] {{{

call pathogen#infect()
call pathogen#helptags()
filet plugin indent on          " use smart settings for filetypes
syntax on                       " use syntax highlighting

let Tlist_Use_Right_Window = 1  " Tlist uses the right window
let Tlist_WinWidth = 33         " Tlist has a width of 33

" }}}

" [Settings] {{{

" display settings {{{
se bg=dark              " who uses light backgrounds in terminals?
se cul                  " show the cursor line
se fdm=manual           " folding on markers > folding on manual
se list                 " set list mode to view special characters
se lcs=tab:\ \          " this makes the cursor appear at the end of tabs
se mouses="s:updown"    " updown cursor on status lines
se mouses+="sd:updown"  " updown cursor when dragging status lines
se mouses+="vs:updown"  " updown cursor on vertical separators
se mouses+="vd:updown"  " updown cursor when dragging vertical separators
se nohls                " search highlighting hurts my eyes :<
se ru                   " display the cursor coordinates
se sb                   " new horizontal splits go on the bottom
se sc                   " show pending commands in the last line
se spr                  " new vertical splits go on the right
" }}}

" behavioural settings {{{
let mapleader="	"       " tab is a way better mapleader than backslash
se bdir=~/.vim/backup   " directory to put backups in
se bs=2                 " allow delete anything in insert mode
se bk                   " make backups, please
se cb=autoselectml      " autoselect for modeless selection (non-GVIM)
se cb+=autoselectplus   " autoselect into the + register (non-GVIM)
se dir=~/.vim/swap      " directory to put swap files in
se fo=r                 " automatically insert comment leader on <CR>
se fo+=o                " automatically insert comment leader on normal o
se fo+=q                " allow formatting comments with gq
se fo+=n                " recognise numbered lists when formatting
se fo+=1                " don't break long lines in insert mode
se fo+=j                " be smart when joining comment lines
se hi=100               " 100 is more than enough command history
se hid                  " hide, not unload, buffers when abandoned
se ml                   " always obey modelines
se mouse=a              " enable the use of the mouse
se swb=split,useopen    " consider existing buffers when using :sb
se tags=./tags          " look where you are for tags first
se tags+=tags;          " look up the tree for tags as necessary
se tw=80                " 80 characters wide all day erry day
se vdir=~/.vim/view     " directory to put views in
se vop=folds            " views remember folds
se vop+=cursor          " views remember cursor position
se wmnu                 " use wildmenu tab completion
" }}}

" indentation and tab setings {{{
se ai                   " use autoindent
se et                   " expand tabs to spaces
se si                   " use smart autoindenting
se sta                  " use smarttab insertion
se sts=8                " use softtabstop for magic space
se sw=4                 " indentation is four spaces
" }}}

" }}}

" [Functions] {{{



" }}}

" [Maps] {{{

" useful maps for writing html / xml {{{
nn <Leader>dt wbF<df>f<df>
nn <Leader>h1 I<h1><Esc>A</h1><Esc>
nn <Leader>h2 I<h2><Esc>A</h2><Esc>
nn <Leader>h3 I<h3><Esc>A</h3><Esc>
nn <Leader>h4 I<h4><Esc>A</h4><Esc>
nn <Leader>h5 I<h5><Esc>A</h5><Esc>
nn <Leader>h6 I<h6><Esc>A</h6><Esc>
nn <Leader>he wbi<em><Esc>ea</em><Esc>bb
nn <Leader>hs wbi<strong><Esc>ea</strong><Esc>bbb
nn <Leader>mt yiwi<<Esc>ea></<Esc>pa><Esc>F<
" }}}

" toggle line numbers
nn <Leader>u :se nu!<CR>

" toggle NERDTree
nn <Leader>n :NERDTreeToggle<CR>

" toggle TagList
nn <Leader>t :TlistToggle<CR>

" }}}

" Favour utf-8 encoding when v:lang ends in utf8 or UTF-8
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    se fencs=utf-8,latin1
endif

" vim: set fdm=marker:
