"" vim: set fdm=marker:
"" Author: Quinn Strahl

filet plugin indent on
syntax on
syntax sync fromstart
colorscheme qstrahl

"" [ Init ] {{{

let $IN_VIM=1

for dir in ["backup","swap","undo","view"]
    if empty(finddir(dir, expand('$HOME').'/.vim'))
        call mkdir(expand('$HOME').'/.vim/'.dir, 'p')
    endif
endfor

"" }}}

"" [ Bundles ] {{{

"" Load everything with Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"" bundle/fugitive
augroup CustomFugitiveConfig
    au!
    au User Fugitive
        \ nno <buffer> <Leader>gb :<C-U>Gblame<CR>|
        \ nno <buffer> <Leader>gd :<C-U>Gdiff<C-R>=v:count?' ~'.v:count :''<CR><CR>|
        \ nno <buffer> <Leader>ge :<C-U>Gedit<C-R>=v:count?' ~'.v:count :''<CR><CR>|
        \ nno <buffer> <Leader>gl :<C-U>Glog --<CR>|
        \ nno <buffer> <Leader>gr :<C-U>Glog<CR>|
        \ nno <buffer> <Leader>gs :<C-U>Gstatus<CR>|
        \ au BufEnter <buffer> if exists(':Glcd') | Glcd | endif
augroup END

"" bundle/surround
let g:surround_indent=1

"" bundle/undotree
let g:undotree_SplitWidth=38

"" bundle/vdebug
augroup CustomVdebugConfig
    au!
    au User VdebugPost
        \ exe 'sign define breakpt text=◆' |
        \ exe 'sign define current text=▶' |
        \ hi clear DbgBreakptLine DbgBreakptSign DbgCurrentLine DbgCurrentSign
augroup END

"" }}}

"" [ Folds ] {{{

se fdm=marker
se fdo=insert,mark,quickfix,search,tag,undo
se fdls=99

"" }}}

"" [ Search ] {{{

se hls
se ic
se is
se scs

"" }}}

"" [ User Interface ] {{{

se fcs =
se fcs+=diff:\ 
se fcs+=fold:╌
se fcs+=stl:\ 
se fcs+=stlnc:\ 
se fcs+=vert:\ 
" se fcs+=stl:━
" se fcs+=stlnc:─
" se fcs+=vert:│
se lcs =
se lcs+=conceal:?
se lcs+=eol:$
se lcs+=extends:»
se lcs+=nbsp:¬
se lcs+=precedes:«
se lcs+=tab:├─
se ls=2
se mouse=ar
se report=0
se sc
se shm=atTAI
se siso=1
se sj=1
se smc=0
se so=999
se ss=1
se stal=2
se wic
se wim=longest:full,full
se wmnu

"" }}}

"" [ Windows ] {{{

se wmw=0
se wmh=0
se sb
se spr

"" }}}

"" [ Special Files & Directories ] {{{

se bdir=~/.vim/backup
se dir=~/.vim/swap//
se tags=./tags;,.git/tags;
se udf
se udir=~/.vim/undo
se vdir=~/.vim/view

"" }}}

"" [ Vim Behaviour ] {{{

se ar
se bs=2
se cb=
se hi=1000
se hid
se inex=substitute(substitute(v:fname,'\\','/','g'),'^/\\+','','')
se isf+=\
se lz
se ml
se path=.,,./*,*,./*/*,*/*,./*/*/*,*/*/*,./*/*/*/*,*/*/*/*,./*/*/*/*/*,*/*/*/*/*,./*/*/*/*/*/*,*/*/*/*/*/*,./*/*/*/*/*/*/*,*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,./*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*,*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*
se re=1
se timeout
se nottimeout
se tm=500
se ttm=0

"" netrw configuration

let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_banner=0
let g:netrw_alto='splitbelow'
let g:netrw_altv='splitright'
let g:netrw_use_errorwindow=0
let g:netrw_bufsettings = 'noma nomod nonu nobl nowrap ro bh=unload'
let g:netrw_keepdir = 0
let g:netrw_browsex_viewer = 'xdg-open'

"" }}}

"" [ Insert Completion ] {{{

se cot+=menuone
se cot-=preview
se cpt=.,w,k,s,i,d,t
se ph=13

"" }}}

"" [ Formatting Options ] {{{

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
se tw=120

"" }}}

"" [ Indentation & Tabs ] {{{

se ai
se et
se si
se sta
se sts=8
se sw=4

"" }}}

"" [ Functions ] {{{

"" Set preview window height to &previewheight, then equalize other windows
function! s:MyWincmdEquals(visual)
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

"" }}}

"" [ Commands ] {{{


"" }}}

"" [ Mappings ] {{{

let mapleader='\'

"" Explore!
noremap \e :<C-U>Explore<CR>
noremap \se :<C-U>Sexplore<CR>
noremap \ve :<C-U>Vexplore!<CR>

"" Start new line (without touching current line) from Insert Mode
ino <A-CR> <C-\><C-N>o

"" normal ~ in insert mode with ^~
ino <C-@> <C-o>~

"" Q closes windows; who needs Ex mode?
nno Q <C-W>c

"" Make Y consistent with C and D
nno Y y$

"" Override default diff normal commands to allow count (specifying buffer)
nno do :<C-U>exe 'diffget' v:count ? get(filter(tabpagebuflist(), 'getbufvar(bufname(v:val), "&diff")'), v:count) : '' '<Bar> diffupdate'<CR>
nno dp :<C-U>exe 'diffput' v:count ? get(filter(tabpagebuflist(), 'getbufvar(bufname(v:val), "&diff")'), v:count) : '' '<Bar> diffupdate'<CR>

"" Add a shortcut to :diffupdate
nno du :<C-U>diffupdate<CR>

nno <expr> <silent> <Plug>MyWincmdEquals <SID>MyWincmdEquals(0)
vno <expr> <silent> <Plug>MyWincmdEquals <SID>MyWincmdEquals(1)

"" Override the default <C-W>= mapping
nmap <C-W>= <Plug>MyWincmdEquals
vmap <C-W>= <Plug>MyWincmdEquals

"" Pull the line under the cursor into the command line
cno <expr> <C-R><C-L> substitute(getline('.'), '^\s\+', '', '')

"" Text object meaning 'a fold'
vno az :<C-U>se fen <Bar> silent! normal! V[zo]z<CR>
ono az :<C-U>se fen <Bar> silent! normal! V[zo]z<CR>

"" Custom unimpaired-style toggles
nno [oz :<C-U>Autofold<CR>
nno ]oz :<C-U>Autofold!<CR>
nno [ov :<C-U>set virtualedit=all<CR>
nno ]ov :<C-U>set virtualedit=<CR>
nno [om :<C-U>Matchmaker<CR>
nno ]om :<C-U>Matchmaker!<CR>
nno [ows :<C-U>set wrapscan<CR>
nno ]ows :<C-U>set nowrapscan<CR>

"" Toggle BreakpointWindow (mnemonic: Breakpoint Browse)
nno <Leader>bb :<C-U>BreakpointWindow<CR>

"" Toggle Tagbar
nno <Leader>t :<C-U>TagbarToggle<CR>

"" Toggle Undotree
nno <Leader>u :<C-U>UndotreeToggle<CR>

"" Clear search highlighting
nno <Leader>/ :<C-U>noh<CR>

"" Display info about highlight group under cursor
nno <Leader>h :<C-U>echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"" }}}

"" [ Autocommands ] {{{

augroup MyProjectile
  au!
  au User ProjectileActivate nnoremap ga :<C-U>A<CR>
augroup END

augroup QuickfixOpenList
    au!
    au QuickfixCmdPost [^l]*
        \ if len(getqflist()) |
            \ botright copen |
            \ wincmd p |
        \ endif
    au QuickfixCmdPost l*
        \ if len(getloclist(0)) |
            \ rightbelow lopen |
            \ wincmd p |
        \ endif
augroup END

augroup MkdirOnWrite
    au!
    au BufWritePre,FileWritePre ?*
        \ if expand('<afile>') !~? '^[a-z0-9]\+:\/\/' |
            \ silent! call mkdir(expand('<afile>:h'), 'p') |
        \ endif
augroup END

augroup UpdateBex
    au!
    au BufWritePre * let &bex=strftime(".%F.%T.backup")
augroup END

augroup SyntaxSuffixesAdd
    au!
    au BufAdd ?* exe 'set sua+=.'.expand('<amatch>:e')
augroup END

augroup EqualWindowsOnResize
    au!
    au VimResized * wincmd =
augroup END

augroup StartVimInDirectory
    au!
    au VimEnter * if expand('<afile>') == '' | Explore
augroup END

augroup AlwaysSyncFromStart
  au!
  au Syntax * syn sync fromstart
augroup END

"" }}}
