" vim: set fdm=marker:
" Author: Quinn Strahl

filet plugin indent on
syntax on

" [ Bundles ] {{{

" Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" }}}

" [ Color & Highlights ] {{{

se bg=dark

hi CursorLine   term=underline cterm=none ctermbg=237
hi CursorColumn term=none                 ctermbg=237

" }}}

" [ Folds ] {{{

se fdm=marker
se fdo-=block
se fdo+=insert
se fdo+=jump

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

se ls=2
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

" automatically make and load views
au BufRead ?* sil! loadview
au BufWrite ?* sil! mkview!

" prevent window from being resized in insert mode
au InsertEnter * sil! let w:previous_wfw_setting=&wfw | sil! let w:previous_wfh_setting=&wfh | sil! se wfw wfh
au InsertLeave * sil! let &wfw=w:previous_wfw_setting | sil! let &wfh=w:previous_wfh_setting

" automatically close completion preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0 | sil! pclose! | endif

" load quickfixes in a new tab with the fix window open
au QuickFixCmdPost [^l]* if len(getqflist()) | tabnew | copen | endif
au QuickFixCmdPost l* if len(getloclist()) | tabnew | lopen | endif

" }}}
