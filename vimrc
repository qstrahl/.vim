" vim: set fdm=marker:
" Author: Quinn Strahl

filet plugin indent on
syntax on

" [ Bundles ] {{{

" Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Surround
let g:surround_indent=1

" Undotree
let g:undotree_SplitWidth=38

" }}}

" [ Color & Highlights ] {{{

se bg=dark
se smc=0

hi CursorLine   term=underline cterm=none ctermbg=237
hi CursorColumn term=none                 ctermbg=237

" }}}

" [ Folds ] {{{

se fdm=marker
se fdo-=block
se fdo+=insert

" }}}

" [ Fillchars ] {{{

se fcs+=vert:\ 
se fcs+=fold:+
se fcs+=diff:-

" }}}

" [ Search ] {{{

se hls
se is
se nows

" }}}

" [ User Interface ] {{{

se ls=2
se mouse=a
se ru
se sc
se so=999
se wim=longest:full,full
se wmnu

" }}}

" [ Windows ] {{{

se wmw=0
se wmh=0
se sb
se spr

" }}}

" [ Special Files & Directories ] {{{

se bdir=~/.vim/backup
se bk
se dir=~/.vim/swap
se udf
se udir=~/.vim/undo
se vdir=~/.vim/view

se tags=./tags;,./TAGS;

" }}}

" [ Editor Behaviour ] {{{

se ar
se bs=2
se hid
se hi=1000
se ml
se swb+=useopen
se vop-=options
se vop-=folds

" }}}

" [ Completion ] {{{
se cot+=menuone
se cot+=longest
se cot-=preview
se cpt=.,w,i,t
se ph=13
" }}}

" [ Formatting Options ] {{{

se fo-=t
se fo+=r
se fo+=n
se fo+=l
se fo+=j
se tw=78

" }}}

" [ Indents & Tabs ] {{{

se ai
se ci
se et
se pi
se si
se sta
se sts=8
se sw=4

" }}}

" [ Maps ] {{{

let mapleader='\'

" Toggle BreakpointWindow (mnemonic: breakpoint browse)
nn <Leader>bb :BreakpointWindow<CR>

" Open Gblame
nn <Leader>gb :Gblame<CR>

" Gcommit all changes
nn <Leader>gc :Gcommit -a<CR>

" View Gdiff
nn <Leader>gd :Gdiff<CR>

" Go to file in working tree
nn <Leader>ge :Gedit<CR>

" View Glog
nn <Leader>gl :Glog<CR>:cw<CR>

" View Gstatus
nn <Leader>gs :Gstatus<CR>

" Toggle NERDTree
nn <Leader>n :NERDTreeToggle<CR>

" Toggle Tagbar
nn <Leader>t :TagbarToggle<CR>

" Toggle Undotree
nn <Leader>u :UndotreeToggle<CR>

" Logical > Compatible
nn Y y$

" Clear search highlighting
nn <Leader>/ :noh<CR>

" }}}

" [ AutoCommands ] {{{

" automatically make and load views
au BufRead ?* sil! loadview
au BufWrite ?* sil! mkview!

" automatically close preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0 | sil! pclose! | endif

" load quickfixes in a new tab with the fix window open
au QuickFixCmdPost [^l]* if len(getqflist()) | tabnew | copen | endif
au QuickFixCmdPost l* if len(getloclist(0)) | tabnew | lopen | endif

" highlight the cursor line in the active window (but not for quickfix)
au VimEnter,WinEnter,BufWinEnter * if !(&buftype == 'quickfix') | setl cul | endif
au WinLeave * setl nocul
" }}}
