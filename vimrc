" vim: set fdm=marker:
"Author: Quinn Strahl"

filet plugin indent on
syntax on
colorscheme qstrahl

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
        \ nno <buffer> <Leader>gb :<C-U>Gblame<CR>|
        \ nno <buffer> <Leader>gc :<C-U>Ggrep '^<<<<<<<'<CR>|
        \ nno <buffer> <Leader>gd :<C-U>Gdiff<C-R>=v:count?' ~'.v:count :''<CR><CR>|
        \ nno <buffer> <Leader>ge :<C-U>Gedit<C-R>=v:count?' ~'.v:count :''<CR><CR>|
        \ nno <buffer> <Leader>gl :<C-U>Gpedit! log<CR><C-W>P|
        \ nno <buffer> <Leader>gf :<C-U>Gllog<CR>|
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
    au User VdebugPost
        \ exe 'sign define breakpt text=◆' |
        \ exe 'sign define current text=▶' |
        \ hi clear DbgBreakptLine DbgBreakptSign DbgCurrentLine DbgCurrentSign
augroup END
hi DbgBreakptLine       cterm=none      ctermfg=none    ctermbg=none
hi DbgBreakptSign       cterm=none      ctermfg=33      ctermbg=none
hi DbgCurrentLine       cterm=none      ctermfg=none    ctermbg=24
hi DbgCurrentSign       cterm=none      ctermfg=38      ctermbg=24

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
se smc=0
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

silent! exe "set <C-Left>=\<Esc>Od"
silent! exe "set <C-Right>=\<Esc>Oc"
silent! exe "set <S-Down>=\<Esc>[b"
silent! exe "set <S-Up>=\<Esc>[a"
silent! exe "set <xDown>=\<Esc>Ob"
silent! exe "set <xUp>=\<Esc>Oa"

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

" Make Y consistent with C and D
nno Y y$

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

augroup SpecialWindowMaps
    au!
    au BufEnter *
        \ if &buftype =~# '\(help\|quickfix\)' |
            \ nno <buffer> q <C-W>q
augroup END

augroup QuickFixOpenList
    au!
    au QuickfixCmdPost [^l]*
        \ if len(getqflist()) |
            \ botright copen |
            \ wincmd p
    au QuickfixCmdPost l*
        \ if len(getloclist(0)) |
            \ rightbelow lopen |
            \ wincmd p
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
