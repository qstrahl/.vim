" vim: set fdm=marker:
" Author: Quinn Strahl

filet plugin on
syntax on

" [ Bundles ] {{{

" Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Vdebug
let g:vdebug_options= {
\    "break_on_open" : 0,
\}

" }}}

" [ Color & Highlights ] {{{

se bg=dark

hi CursorLine   term=underline cterm=none ctermbg=237
hi CursorColumn term=none                 ctermbg=237

" }}}

" [ Folds ] {{{

se fdm=syntax
se fdo-=block
se fdo-=hor
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

" }}}

" [ User Interface ] {{{

se mouse=a
se ru
se sc
se so=999
se wim=longest:full,full
se wmnu

" }}}

" [ Windows ] {{{

se sb
se spr
se wmh=0
se wmw=0

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

" }}}

" [ Completion ] {{{
se cot+=menuone
se cot+=longest
se cpt=.,w,i,t
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

let mapleader=' '

" toggle NERDTree
nn <Leader>n :NERDTreeToggle<CR>

" toggle TagList
nn <Leader>t :TagbarToggle<CR>

" clear search highlighting
nn <Leader>/ :noh<CR>

" }}}

" [ AutoCommands ] {{{

" Automatic views
au BufRead ?* sil! loadview
au BufWrite ?* sil! mkview!

" automatically close completion preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0 | sil! pclose | endif

" }}}
