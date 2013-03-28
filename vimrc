" vim: set fdm=marker:
" Author: Quinn Strahl

filet plugin indent on
syntax on

" [ Bundles ] {{{

" Load everything with Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" bundle/surround
let g:surround_indent=1

" bundle/undotree
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
se fdo=insert,mark,quickfix,search,tag,undo

" }}}

" [ Search ] {{{

se hls
se ic
se is
se scs

" }}}

" [ User Interface ] {{{

se fcs+=vert:\ 
se fcs+=fold:+
se fcs+=diff:-
se ls=2
se mouse=a
se report=0
se ru
se sc
se shm=atTAI
se so=999
se stl=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
se wic
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

" [ Vim Behaviour ] {{{

se ar
se bs=2
se hid
se hi=1000
se ml
se vop-=options
se vop-=folds

" }}}

" [ Shell Settings ] {{{

let $EDITOR="vim --remote-wait-silent"
let $PAGER="vim --remote-tab-wait-silent"
let $MANPAGER="vim --remote-tab-wait-silent"

" }}}

" [ Insert Completion ] {{{

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

" [ Indentation & Tabs ] {{{

se ai
se ci
se et
se si
se sr
se sta
se sts=8
se sw=4

" }}}

" [ Functions ] {{{

function! s:Gedit(count)
    if a:count
        exe 'Gedit ~'.a:count
    else
        exe 'Gedit'
    endif
endfunction

function! s:Gdiff(count)
    if a:count
        exe 'Gdiff ~'.a:count
    else
        exe 'Gdiff'
    endif
endfunction

" }}}

" [ Maps ] {{{

let mapleader='\'

" Toggle BreakpointWindow (mnemonic: breakpoint browse)
nn <Leader>bb :<C-U>BreakpointWindow<CR>

" Open Gblame
nn <Leader>gb :<C-U>Gblame<CR>

" Go to Conflicts
nn <Leader>gc :<C-U>Ggrep '^<<<<<<<'<CR>

" View Gdiff
nn <Leader>gd :<C-U>call <SID>Gdiff(v:count)<CR>

" Go to file in working tree
nn <Leader>ge :<C-U>call <SID>Gedit(v:count)<CR>

" View Glog
nn <Leader>gl :<C-U>Gllog<CR>

" View Gstatus
nn <Leader>gs :<C-U>Gstatus<CR>

" Toggle NERDTree
nn <Leader>n :<C-U>NERDTreeToggle<CR>

" Toggle quickfix/location lists
nn <Leader>qw :<C-U>cwindow<CR>
nn <Leader>lw :<C-U>lwindow<CR>
nn <Leader>qc :<C-U>cclose<CR>
nn <Leader>lc :<C-U>lclose<CR>
nn <Leader>qd :<C-U>cex [] <Bar> cwindow <Bar> echo "Quickfix list deleted"<CR>
nn <Leader>ld :<C-U>lex [] <Bar> lwindow <Bar> echo "Location list deleted"<CR>

" Toggle Tagbar
nn <Leader>t :<C-U>TagbarToggle<CR>

" Toggle Undotree
nn <Leader>u :<C-U>UndotreeToggle<CR>

" Clear search highlighting
nn <Leader>/ :<C-U>noh<CR>

" Text object meaning "a fold"
vno az :<C-U>se fen <Bar> silent! normal! V[zo]z<CR>
ono az :<C-U>se fen <Bar> silent! normal! V[zo]z<CR>

" Unimpaired-style mappings for custom settings
nn [oz :<C-U>Autofold
nn ]oz :<C-U>Autofold!
nn [om :<C-U>Matchmaker
nn ]om :<C-U>Matchmaker!

" }}}

" [ Autocommands ] {{{

" automatically make and load views
augroup Autoview
    au!
    au BufRead ?* sil! loadview
    au BufWrite ?* sil! mkview!
augroup END

" automatically close preview window
" augroup autopreviewclose
"     au!
"     au CursorMovedI,InsertLeave * if pumvisible() == 0 | sil! pclose! | endif
" augroup END

" highlight the cursor line in the active window
augroup CursorHighlight
    au!
    au VimEnter,WinEnter,BufWinEnter * setl cul
    au WinLeave * setl nocul
augroup END

" you fold when and only when I tell you to fold
augroup DisableFolding
    au!
    au BufWinEnter * set nofen
augroup END

augroup QuickFixOpenList
    au!
    au QuickfixCmdPost [^l]* cwindow
    au QuickfixCmdPost l* lwindow
augroup END

" }}}
