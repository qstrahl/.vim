" vim: set fdm=marker:
"Author: Quinn Strahl"

filet plugin indent on
syntax on

"[ Init ]" {{{

for dir in ["backup","swap","undo","view"]
    if empty(finddir(dir, expand('$HOME').'/.vim'))
        call mkdir(expand('$HOME').'/.vim/'.dir, 'p')
    endif
endfor

if &term =~? 'xterm'
    set t_Co=256
endif

"}}}

"[ Bundles ]" {{{

"Load everything with Pathogen"
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"bundle/fugitive"
au User Fugitive let &l:path=fugitive#repo().tree().'/**,'.fugitive#repo().tree().'/;'

"bundle/nerdtree"
let NERDTreeHijackNetrw=0

"bundle/surround"
let g:surround_indent=1

"bundle/undotree"
let g:undotree_SplitWidth=38

"bundle/vdebug"
au VimEnter * sign define breakpt text=◆ linehl=DbgBreakLine texthl=DbgBreakText
au VimEnter * sign define current text=▶ linehl=DbgCurLine texthl=DbgCurText

"}}}

"[ Color & Highlights ]" {{{

hi Conceal      term=reverse    cterm=none      ctermfg=237     ctermbg=none
hi Cursor       term=reverse    cterm=none      ctermfg=15      ctermbg=252
hi CursorLine   term=underline  cterm=none      ctermfg=none    ctermbg=235
hi CursorLineNR term=bold       cterm=bold      ctermfg=242     ctermbg=235
hi DbgBreakLine term=reverse    cterm=none      ctermfg=none    ctermbg=none
hi DbgBreakText term=none       cterm=none      ctermfg=33      ctermbg=none
hi DbgCurLine   term=none       cterm=none      ctermfg=none    ctermbg=24
hi DbgCurText   term=none       cterm=none      ctermfg=38      ctermbg=24
hi DiffAdd      term=none       cterm=none      ctermfg=none    ctermbg=22
hi DiffChange   term=underline  cterm=none      ctermfg=none    ctermbg=53
hi DiffDelete   term=reverse    cterm=none      ctermfg=1       ctermbg=52
hi DiffText     term=reverse    cterm=none      ctermfg=15      ctermbg=5
hi FoldColumn   term=none       cterm=none      ctermfg=246     ctermbg=237
hi Folded       term=none       cterm=none      ctermfg=246     ctermbg=237
hi IncSearch    term=underline  cterm=bold      ctermfg=252     ctermbg=4
hi NonText      term=reverse    cterm=none      ctermfg=237     ctermbg=none
hi LineNr       term=none       cterm=none      ctermfg=239     ctermbg=none
hi Normal       term=none       cterm=none      ctermfg=252     ctermbg=234
hi Pmenu        term=reverse    cterm=none      ctermfg=250     ctermbg=25
hi PmenuSel     term=underline  cterm=bold      ctermfg=15      ctermbg=33
hi PmenuSbar    term=none       cterm=none      ctermfg=31      ctermbg=31
hi PmenuThumb   term=reverse    cterm=none      ctermfg=250     ctermbg=250
hi Search       term=reverse    cterm=none      ctermfg=15      ctermbg=27
hi SignColumn   term=none       cterm=none      ctermfg=none    ctermbg=none
hi SpecialKey   term=reverse    cterm=none      ctermfg=14      ctermbg=23
hi StatusLine   term=reverse    cterm=none      ctermfg=243     ctermbg=236
hi StatusLineNC term=reverse    cterm=none      ctermfg=0       ctermbg=0
hi TabLine      term=underline  cterm=underline ctermfg=240     ctermbg=235
hi TabLineFill  term=underline  cterm=underline ctermfg=240     ctermbg=0
hi TabLineSel   term=reverse    cterm=bold      ctermfg=15      ctermbg=240
hi Title        term=none       cterm=none      ctermfg=none    ctermbg=none
hi VertSplit    term=none       cterm=none      ctermfg=0       ctermbg=0
hi Visual       term=reverse    cterm=none      ctermfg=none    ctermbg=236
hi WildMenu     term=none       cterm=bold      ctermfg=190     ctermbg=236
hi! link CursorColumn CursorLine

se bg=dark
se smc=0

"}}}

"[ Folds ]" {{{

se fdm=marker
se fdo=insert,mark,quickfix,search,tag,undo
se fdls=99

"}}}

"[ Search ]" {{{

se hls
se ic
se is
se scs

"}}}

"[ User Interface ]" {{{

se fcs =
se fcs+=diff:╲
se fcs+=fold:-
se fcs+=stl:\ 
se fcs+=stlnc:\ 
se fcs+=vert:\ 
se lcs =
se lcs+=conceal:?
se lcs+=eol:$
se lcs+=extends:»
se lcs+=nbsp:¬
se lcs+=precedes:«
se lcs+=tab:├─
se ls=2
se mouse=a
se report=0
se ru
se sc
se shm=atTAI
se siso=1
se sj=1
se so=999
se ss=1
se wic
se wim=longest:full,full
se wmnu

"}}}

"[ Windows ]" {{{

se wmw=0
se wmh=0
se sb
se spr

"}}}

"[ Special Files & Directories ] {{{

se bdir=~/.vim/backup
se dir=~/.vim/swap
se tags=./tags;,./TAGS;
se udf
se udir=~/.vim/undo
se vdir=~/.vim/view

"}}}

"[ Vim Behaviour ]" {{{

se ar
se bs=2
se hi=1000
se hid
se inex=substitute(substitute(v:fname,'\\','/','g'),'^/\\+','','')
se isf+=\
se ml
se noto
se path=./;,./**,**
se ttimeout
se ttm=0

"}}}

"[ Keycodes ] {{{

set <C-Left>=Od
set <C-Right>=Oc
set <S-Down>=[b
set <S-Up>=[a
set <xDown>=Ob
set <xUp>=Oa

"}}}

"[ Insert Completion ]" {{{

se cot+=menuone
se cot+=longest
se cpt=.,w,i,t
se ph=13

"}}}

"[ Formatting Options ]" {{{

se fo =
se fo+=a
se fo+=c
se fo+=j
se fo+=l
se fo+=n
se fo+=o
se fo+=q
se fo+=r
se fo+=w
se tw=78

"}}}

"[ Indentation & Tabs ]" {{{

se ai
se et
se si
se sr
se sta
se sts=8
se sw=4

"}}}

"[ Functions ]" {{{

function! s:QfCmdPost()
    if len(getqflist())
        botright copen
        wincmd p
    endif
endfunction

function! s:LocCmdPost()
    if len(getloclist(0))
        rightbelow lopen
        wincmd p
    endif
endfunction

"}}}

"[ Mappings ]" {{{

let mapleader='\'

"Pull the line under the cursor into the command line"
cno <expr> <C-R><C-L> substitute(getline('.'), '^\s\+', '', '')

"Text object meaning 'a fold'"
vno az :<C-U>se fen <Bar> silent! normal! V[zo]z<CR>
ono az :<C-U>se fen <Bar> silent! normal! V[zo]z<CR>

"Custom unimpaired-style toggles"
nno [oz :<C-U>Autofold<CR>
nno ]oz :<C-U>Autofold!<CR>
nno [ov :<C-U>set virtualedit=all<CR>
nno ]ov :<C-U>set virtualedit=<CR>
nno [om :<C-U>Matchmaker<CR>
nno ]om :<C-U>Matchmaker!<CR>

"View Git Blame of current file"
nno <C-G><C-B> :<C-U>Gblame<CR>
nno <C-G>b :<C-U>Gblame<CR>

"Find Git Conflicts"
nno <C-G>c :<C-U>Ggrep '^<<<<<<<'<CR>

"View Git Diff of current file"
nno <C-G><C-D> :<C-U>Gdiff<C-R>=v:count ? ' ~'.v:count : ''<CR><CR>
nno <C-G>d :<C-U>Gdiff<C-R>=v:count ? ' ~'.v:count : ''<CR><CR>

"Shortcut for :Gedit"
nno <C-G><C-E> :<C-U>Gedit<C-R>=v:count ? ' ~'.v:count : ''<CR><CR>
nno <C-G>e :<C-U>Gedit<C-R>=v:count ? ' ~'.v:count : ''<CR><CR>

"View Git Log"
nno <C-G><C-L> :<C-U>Git log<CR>
nno <C-G>l :<C-U>Git log<CR>

"Shortcut for :Gllog (mnemonic: Git File)"
nno <C-G><C-F> :<C-U>Gllog<CR>
nno <C-G>f :<C-U>Gllog<CR>

"Git Status"
nno <C-G><C-S> :<C-U>Gstatus<CR>
nno <C-G>s :<C-U>Gstatus<CR>

"Toggle BreakpointWindow (mnemonic: Breakpoint Browse)"
nno <Leader>bb :<C-U>BreakpointWindow<CR>

"Toggle NERDTree"
nno <Leader>n :<C-U>NERDTreeToggle<CR>

"Toggle Tagbar"
nno <Leader>t :<C-U>TagbarToggle<CR>

"Toggle Undotree"
nno <Leader>u :<C-U>UndotreeToggle<CR>

"Clear search highlighting"
nno <Leader>/ :<C-U>noh<CR>

"}}}

"[ Autocommands ]" {{{

augroup AutoPclose
    au!
    au CompleteDone * pclose!
augroup END

augroup CmdWindowIgnoreComepleteDone
    au!
    au CmdWinEnter * set ei+=CompleteDone
    au CmdWinLeave * set ei-=CompleteDone
augroup END

augroup QuickFixOpenList
    au!
    au QuickfixCmdPost [^l]* call s:QfCmdPost()
    au QuickfixCmdPost l* call s:LocCmdPost()
augroup END

augroup MkdirOnWrite
    au!
    au BufWritePre,FileWritePre ?* silent! call mkdir(expand('%:h'), 'p')
augroup END

augroup UpdateBex
    au!
    au BufWritePre * let &bex=strftime(".%F.%T.backup")
augroup END

augroup SyntaxSuffixesAdd
    au!
    au BufAdd ?* exe 'set sua+=.'.expand('<afile>:e')
augroup END

"}}}
