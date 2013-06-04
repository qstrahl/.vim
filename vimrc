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
augroup CustomFugitiveConfig
    au!
    au User Fugitive
        \ let &l:path=fugitive#repo().tree().'/**,'.fugitive#repo().tree().'/;' |
        \ nno <buffer> <Leader>gb :<C-U>Gblame<CR> |
        \ nno <buffer> <Leader>gc :<C-U>Ggrep '^<<<<<<<'<CR> |
        \ nno <buffer> <Leader>gd :<C-U>Gdiff<C-R>=v:count?' ~'.v:count :''<CR><CR> |
        \ nno <buffer> <Leader>ge :<C-U>Gedit<C-R>=v:count?' ~'.v:count :''<CR><CR> |
        \ nno <buffer> <Leader>gl :<C-U>Git log<CR> |
        \ nno <buffer> <Leader>gf :<C-U>Gllog<CR> |
        \ nno <buffer> <Leader>gs :<C-U>Gstatus<CR>
augroup END

"bundle/nerdtree"
let NERDTreeHijackNetrw=0

"bundle/surround"
let g:surround_indent=1

"bundle/undotree"
let g:undotree_SplitWidth=38

"bundle/vdebug"
augroup CustomVdebugConfig
    au!
    au VimEnter *
        \ sign define breakpt text=◆ linehl=DbgBreakLine texthl=DbgBreakText |
        \ sign define current text=▶ linehl=DbgCurLine texthl=DbgCurText
augroup END

"}}}

"[ Color & Highlights ]" {{{

hi Conceal      cterm=none      ctermfg=237     ctermbg=none
hi Cursor       cterm=none      ctermfg=0       ctermbg=255
hi CursorLine   cterm=none      ctermfg=none    ctermbg=235
hi CursorLineNr cterm=bold      ctermfg=242     ctermbg=235
hi DbgBreakLine cterm=none      ctermfg=none    ctermbg=none
hi DbgBreakText cterm=none      ctermfg=33      ctermbg=none
hi DbgCurLine   cterm=none      ctermfg=none    ctermbg=24
hi DbgCurText   cterm=none      ctermfg=38      ctermbg=24
hi DiffAdd      cterm=none      ctermfg=none    ctermbg=22
hi DiffChange   cterm=none      ctermfg=none    ctermbg=53
hi DiffDelete   cterm=none      ctermfg=1       ctermbg=52
hi DiffText     cterm=none      ctermfg=15      ctermbg=5
hi FoldColumn   cterm=none      ctermfg=246     ctermbg=237
hi Folded       cterm=none      ctermfg=246     ctermbg=237
hi IncSearch    cterm=bold      ctermfg=252     ctermbg=4
hi NonText      cterm=none      ctermfg=237     ctermbg=none
hi LineNr       cterm=none      ctermfg=239     ctermbg=none
hi Normal       cterm=none      ctermfg=252     ctermbg=234
hi Pmenu        cterm=none      ctermfg=27      ctermbg=18
hi PmenuSel     cterm=bold      ctermfg=33      ctermbg=20
hi PmenuSbar    cterm=none      ctermfg=none    ctermbg=17
hi PmenuThumb   cterm=none      ctermfg=250     ctermbg=26
hi Search       cterm=none      ctermfg=15      ctermbg=27
hi SignColumn   cterm=none      ctermfg=none    ctermbg=none
hi SpecialKey   cterm=none      ctermfg=14      ctermbg=23
hi StatusLine   cterm=none      ctermfg=242     ctermbg=0
hi StatusLineNC cterm=none      ctermfg=236     ctermbg=0
hi TabLine      cterm=none      ctermfg=236     ctermbg=0
hi TabLineFill  cterm=none      ctermfg=0       ctermbg=0
hi TabLineSel   cterm=none      ctermfg=242     ctermbg=0
hi Title        cterm=bold      ctermfg=none    ctermbg=none
hi VertSplit    cterm=none      ctermfg=236     ctermbg=0
hi Visual       cterm=none      ctermfg=none    ctermbg=238
hi WildMenu     cterm=bold      ctermfg=255     ctermbg=0
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
se fcs+=fold:┈
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

"[ Special Files & Directories ]" {{{

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
se path=./**,**,./;,;
se ttimeout
se ttm=0

"}}}

"[ Keycodes ]" {{{

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
se cot-=preview
se cpt=.,w,i,t
se ph=13

"}}}

"[ Formatting Options ]" {{{

se flp=^\\s*\\(\\d\\+[\\]:.)}\\t\ ]\\\|[\\*\\-]\\)\\s*
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

" Set preview window height to &previewheight, then equalize other windows
function! s:CustomWincmdEquals(visual)
    try
        let w = winnr()
        wincmd P
        exe &previewheight.'wincmd _'
        exe w.'wincmd w'
    catch /^E441:/
        continue
    finally
        return "\<C-W>=" . (a:visual ? 'gv' : '')
    endtry
endfunction

" }}}

"[ Mappings ]" {{{

let mapleader='\'

nno <silent> <Plug>CustomwincmdEquals @=<SID>CustomWincmdEquals(0)<CR>
vno <silent> <Plug>CustomwincmdEquals @=<SID>CustomWincmdEquals(1)<CR>

"Override the default <C-W>= mapping
nmap <C-W>= <Plug>CustomwincmdEquals
vmap <C-W>= <Plug>CustomwincmdEquals

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

augroup HelpWindows
    au!
    au BufEnter * if &buftype ==# 'help' | nno <buffer> q <C-W>q
augroup END

augroup QuickFixOpenList
    au!
    au QuickfixCmdPost [^l]* if len(getqflist()) | botright copen | wincmd p
    au QuickfixCmdPost l* if len(getloclist(0)) | rightbelow lopen | wincmd p
augroup END

augroup MkdirOnWrite
    au!
    au BufWritePre,FileWritePre ?*
        \ if expand('<afile>') !~? '^[a-z0-9]\+:\/\/' |
            \ silent! call mkdir(expand('<afile>:h'), 'p')
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
