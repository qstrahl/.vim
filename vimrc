" vim: set fdm=marker:
" Author: Quinn Strahl

filet plugin indent on
syntax on

" [ Bundles ] {{{

" Load everything with Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" bundle/matchmaker
hi MatchMaker   term=none       cterm=none      ctermfg=none    ctermbg=237

" bundle/powerline
let g:Powerline_symbols='fancy'

" bundle/surround
let g:surround_indent=1

" bundle/undotree
let g:undotree_SplitWidth=38

" }}}

" [ Color & Highlights ] {{{

hi Conceal      term=reverse    cterm=none      ctermfg=237     ctermbg=none
hi Cursor       term=reverse    cterm=none      ctermfg=15      ctermbg=252
hi CursorLine   term=underline  cterm=none      ctermfg=none    ctermbg=235
hi DiffAdd      term=none       cterm=none      ctermfg=2       ctermbg=22
hi DiffChange   term=underline  cterm=none      ctermfg=5       ctermbg=53
hi DiffDelete   term=reverse    cterm=none      ctermfg=1       ctermbg=52
hi DiffText     term=reverse    cterm=none      ctermfg=15      ctermbg=5
hi FoldColumn   term=none       cterm=none      ctermfg=15      ctermbg=240
hi Folded       term=none       cterm=none      ctermfg=15      ctermbg=240
hi IncSearch    term=underline  cterm=none      ctermfg=252     ctermbg=4
hi NonText      term=reverse    cterm=none      ctermfg=237     ctermbg=none
hi Normal       term=none       cterm=none      ctermfg=252     ctermbg=234
hi Pmenu        term=reverse    cterm=none      ctermfg=250     ctermbg=25
hi PmenuSel     term=underline  cterm=none      ctermfg=15      ctermbg=33
hi PmenuSbar    term=none       cterm=none      ctermfg=31      ctermbg=31
hi PmenuThumb   term=reverse    cterm=none      ctermfg=250     ctermbg=250
hi Search       term=reverse    cterm=none      ctermfg=15      ctermbg=27
hi SpecialKey   term=reverse    cterm=none      ctermfg=14      ctermbg=23
hi StatusLine   term=reverse    cterm=none      ctermfg=239     ctermbg=0
hi TabLine      term=underline  cterm=underline ctermfg=240     ctermbg=235
hi TabLineFill  term=underline  cterm=underline ctermfg=240     ctermbg=0
hi TabLineSel   term=reverse    cterm=none      ctermfg=15      ctermbg=240
hi VertSplit    term=none       cterm=none      ctermfg=0       ctermbg=0
hi Visual       term=reverse    cterm=none      ctermfg=none    ctermbg=240
hi WildMenu     term=none       cterm=none      ctermfg=15      ctermbg=0

se bg=dark
se smc=0

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

se fcs+=diff:\\
se fcs+=fold:-
se fcs+=vert:\ 
se lcs =
se lcs+=conceal:?
se lcs+=eol:$
se lcs+=extends:»
se lcs+=nbsp:¬
se lcs+=precedes:«
se lcs+=tab:˫-
se list
se ls=2
se mouse=a
se nowrap
se report=0
se ru
se sc
se shm=atTAI
se siso=1
se sj=1
se so=0
se ss=1
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
se notimeout
se ttimeout
se vop-=options
se vop-=folds

" }}}

" [ Insert Completion ] {{{

se cot+=menuone
se cot+=longest
se cpt=.,w,i,t
se ph=13

" }}}

" [ Formatting Options ] {{{

se fo-=t
se fo+=r
se fo+=n
se fo+=l
se fo+=j
se tw=80

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

" Manipulate quickfix/location lists
nn yqq :<C-U>copen<CR>
nn yqw :<C-U>lopen<CR>
nn dqq :<C-U>cclose<CR>
nn dqw :<C-U>lclose<CR>
nn cqq :<C-U>exe 'cnewer' v:count1<CR>
nn cqQ :<C-U>exe 'colder' v:count1<CR>
nn cQQ :<C-U>exe 'colder' v:count1<CR>
nn cqw :<C-U>exe 'lnewer' v:count1<CR>
nn cqW :<C-U>exe 'lolder' v:count1<CR>
nn cQW :<C-U>exe 'lolder' v:count1<CR>

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
no [oz :<C-U>Autofold<CR>
no ]oz :<C-U>Autofold!<CR>
no [ov :<C-U>set virtualedit=all<CR>
no ]ov :<C-U>set virtualedit=<CR>
no [om :<C-U>Matchmaker<CR>
no ]om :<C-U>Matchmaker!<CR>

" }}}

" [ Autocommands ] {{{

" automatically make and load views
augroup Autoview
    au!
    au BufRead ?* sil! loadview
    au BufWrite ?* sil! mkview!
augroup END

" automatically close preview window after completion is done
augroup AutoPclose
    au!
    au CompleteDone * pclose!
augroup END

" highlight the cursor line in the active window
" augroup CursorHighlight
"     au!
"     au VimEnter,WinEnter,BufWinEnter * if &buftype != 'quickfix' | setl cul | endif
"     au WinLeave * setl nocul
" augroup END

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

augroup MkdirOnWrite
    au!
    au BufWritePre,FileWritePre ?* silent! call mkdir(expand('%:h'), 'p')
augroup END

" }}}
