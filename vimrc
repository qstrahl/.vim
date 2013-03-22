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
se fdo=insert,mark,quickfix,search,tag,undo

" }}}

" [ Fillchars ] {{{

se fcs+=vert:\ 
se fcs+=fold:+
se fcs+=diff:-

" }}}

" [ Search ] {{{

se hls
se ic
se is
se scs

" }}}

" [ User Interface ] {{{

se ls=2
se mouse=a
se ru
se sc
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

" [ Editor Behaviour ] {{{

se ar
se bs=2
se hid
se hi=1000
se ml

se vop-=options
se vop-=folds

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

" [ Functions ] {{{

" I like pretending my stuff is vim core
function! s:GetErrorMsg(exception)
    return strpart(a:exception, stridx(a:exception, ':') + 1)
endfunction

" Closing to the right is stupid
function! s:TabcloseLeft(bang)
    let l:goleft = 0
    if tabpagenr('$') > 1 && tabpagenr() > 1 && tabpagenr() != tabpagenr('$')
        let l:goleft = 1
    endif
    try
        exe 'tabclose'.(a:bang ? '!' : '')
    catch
        echohl ErrorMsg
        echo s:GetErrorMsg(v:exception)
        echohl None
    endtry
    if l:goleft
        tabprevious
    endif
endfunction

" Symmetry is beautiful
function! s:TabspLeft()
   tab sp
   exe 'tabm' tabpagenr() - 2
endfunction

" }}}

" [ Commands ] {{{
    
command! -bang -nargs=0 TabcloseLeft call s:TabcloseLeft(<bang>0)
command! -nargs=0 TabnewLeft call s:TabnewLeft()

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
nn <Leader>gd :<C-U>Gdiff<CR>

" Go to file in working tree
nn <Leader>ge :<C-U><CR>

" View Glog
nn <Leader>gl :<C-U>Gllog<CR>

" View Gstatus
nn <Leader>gs :<C-U>Gstatus<CR>

" Toggle NERDTree
nn <Leader>n :<C-U>NERDTreeToggle<CR>

" Toggle Tagbar
nn <Leader>t :<C-U>TagbarToggle<CR>

" Toggle Undotree
nn <Leader>u :<C-U>UndotreeToggle<CR>

" Clear search highlighting
nn <Leader>/ :<C-U>noh<CR>

" W wasn't taken and I want these in two keystrokes
nn [w :<C-U>TabcloseLeft<CR>
nn ]w :<C-U>tab sp<CR>

" Text object meaning "a fold"
vno az :<C-U>se fen <Bar> silent! normal! V[zo]z<CR>
ono az :<C-U>se fen <Bar> silent! normal! V[zo]z<CR>

" }}}

" [ AutoCommands ] {{{

" automatically make and load views
augroup autoview
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
augroup cursorhighlight
    au!
    au VimEnter,WinEnter,BufWinEnter * setl cul
    au WinLeave * setl nocul
augroup END

" you fold when and only when I tell you to fold
augroup disablefolding
    au!
    au BufWinEnter * set nofen
augroup END

" }}}
