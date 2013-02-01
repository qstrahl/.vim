" Author: Quinn Strahl
" Best Ever: Bex

" [Plugins] {{{

call pathogen#infect()
call pathogen#helptags()

filet plugin indent on          " use smart settings for filetypes
syntax on                       " use syntax highlighting

" }}}

" [Settings] {{{

" display settings {{{

" Highlight Colours
hi CursorLine   term=underline cterm=none ctermbg=237
hi CursorColumn term=none ctermbg=237
hi DbgBreakPt   term=reverse ctermbg=95 ctermfg=none cterm=none
hi DbgCurrent   term=reverse ctermbg=94 ctermfg=none cterm=none

se bg=dark              " who uses light backgrounds in terminals?
"se cuc                  " highlight the column the cursor is on
"se cul                  " highlight the line the cursor is on
se fdm=syntax           " use syntax-based folding by default
se fdo =                " foldopen
se fdo+=hor             " open folds on a horizontal movement command
se fdo+=insert          " open folds on any command in insert mode
se fdo+=jump            " open folds on far jumps; G, gg, :<line>, etc
se fdo+=mark            " open folds on jump to mark
se fdo+=percent         " open folds on %
se fdo+=quickfix        " open folds on quickfix jumps
se fdo+=search          " open folds on search into fold
se fdo+=tag             " open folds on tag jump
se fdo+=undo            " open folds on undo/redo commands
se fcs =                " fillchars
se fcs+=fold:-          " fill foldlines with '-'
se fcs+=diff:-          " fill removed lines in diff with '-'
se lcs =                " listchars
se lcs+=tab:\ \         " this makes the cursor appear at the end of tabs
se lcs+=precedes:<      " show < when we can scroll to the left
se lcs+=extends:>       " show > when we can scroll to the right
se list                 " set list mode to view special characters
se noea                 " don't equalize window sizes; equality is for losers
se nohls                " search highlighting hurts my eyes :<
se pvh=13               " preview window is 13 lines high
se ru                   " display the cursor coordinates
se sb                   " new horizontal splits go on the bottom
se sc                   " show pending commands in the last line
"se siso=999             " arbitrarily huge sidescrolloff centres cursor
se so=999               " arbitrarily huge scrolloff centres cursor
se spr                  " new vertical splits go on the right
se wh=10                " current window tries to be this high
se wiw=10               " current window tries to be this wide
se wmh=0                " minimum height of windows is 0 lines
se wmw=0                " minimum width of windows is 0 lines
" }}}

" behavioural settings {{{
se bdir=~/.vim/backup   " directory to put backups in
se bk                   " make backups, please
se bs=2                 " allow delete anything in insert mode
se cb+=autoselectml     " autoselect for modeless selection (non-GVIM)
"se cb+=autoselectplus   " autoselect into the + register (non-GVIM)
se dir=~/.vim/swap      " directory to put swap files in
se fo =                 " formatoptions
se fo+=1                " don't break long lines in insert mode
se fo+=j                " be smart when joining comment lines
se fo+=n                " recognise numbered lists when formatting
se fo+=o                " automatically insert comment leader on normal o
se fo+=q                " allow formatting comments with gq
se fo+=r                " automatically insert comment leader on <CR>
se hi=100               " 100 is more than enough command history
se hid                  " hide, not unload, buffers when abandoned
se is                   " search as you type
se mouse=a              " enable the use of the mouse
se sb                   " splitbelow
se swb=useopen          " consider existing buffers when using :sb
se tags =               " tags file locations
se tags+=./tags         " look where you are for tags first
se tags+=tags;          " look up the tree for tags as necessary
se tw=80                " 80 characters wide all day erry day
se udf                  " keep persistent undo files
se udir=~/.vim/undo     " directory to put persistent undo files in
se vdir=~/.vim/view     " directory to put views in
se vop =                " viewoptions
se vop+=cursor          " views remember cursor position
se wim =                " wildmode
se wim+=longest:full    " complete as much as possible and show wildmenu
se wim+=full            " then complete from possible matches
se wmnu                 " use wildmenu tab completion
" }}}

" indentation and tab setings {{{
se ai                   " use autoindent
se ci                   " paste uses indent structure of current context
se et                   " expand tabs to spaces
se pi                   " preserve indent structure when possible
se si                   " use smart autoindenting
se sta                  " use smarttab insertion
se sts=8                " use softtabstop for magic space
se sw=4                 " indentation is four spaces
" }}}

" }}}

" [Functions] {{{



" }}}

" [Maps] {{{

let mapleader='\'       " backslash is my mapleader of choice

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
nn <Leader>N :NERDTreeToggle<CR>

" toggle TagList
nn <Leader>T :TagbarToggle<CR>

" }}}

" Favour utf-8 encoding when v:lang ends in utf8 or UTF-8
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    se fencs=utf-8,latin1
endif

" Make views automatic
au BufRead ?* sil! loadview
au BufWrite ?* sil! mkview!

" Maximize windows when I switch to them
"au WinEnter * wincmd _ | wincmd |

" Crosshair the cursor, but only for the active window
au VimEnter,WinEnter,BufWinEnter * setl cul cuc
au WinLeave * setl nocul nocuc

" vim: set fdm=marker:
