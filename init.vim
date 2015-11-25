"" vim: set fdm=marker:
"" Author: Quinn Strahl

"" I can't believe I have to do this
let datadir = ($XDG_DATA_HOME ? $XDG_DATA_HOME : $HOME) . '/.local/share/nvim'
let confdir = expand('<sfile>:h')
let initfile = expand('<sfile>')

"" UltiSnips {{{
let g:UltiSnipsUsePythonVersion         = 2
let g:UltiSnipsEditSplit                = 'context'
let g:UltiSnipsSnippetsDir              = confdir . '/UltiSnips'
let g:UltiSnipsExpandTrigger            = '<Tab>'
let g:UltiSnipsListSnippets             = '<C-s>'
let g:UltiSnipsJumpForwardTrigger       = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger      = '<S-Tab>'
"" }}}

"" Syntastic {{{
let g:syntastic_auto_loc_list = 2
let g:syntastic_error_symbol  = '✖'
let g:syntastic_style_error_symbol  = '✖'
let g:syntastic_warning_symbol  = '❢'
let g:syntastic_style_warning_symbol  = '❢'
"" }}}

"" YouCompleteMe {{{
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_key_invoke_completion = ''
let g:ycm_min_num_of_chars_for_completion = 1
"" }}}

"" tern_for_vim {{{
let g:tern_show_signature_in_pum = 1
"" }}}

filetype off

"" Load everything with Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin indent on
syntax on
syntax sync fromstart

set background=dark
colorscheme solarized
hi Comment      cterm=italic
hi StatusLine   cterm=bold              ctermbg=8       ctermfg=10
hi StatusLineNC cterm=bold              ctermbg=8       ctermfg=10
hi VertSplit    cterm=none              ctermbg=8       ctermfg=10
hi WildMenu     cterm=bold              ctermbg=8       ctermfg=15

hi! link SignColumn FoldColumn
hi SyntasticErrorSign cterm=none ctermbg=0 ctermfg=1
hi SyntasticStyleErrorSign cterm=none ctermbg=0 ctermfg=1
hi SyntasticWarningSign cterm=none ctermbg=0 ctermfg=3
hi SyntasticStyleWarningSign cterm=none ctermbg=0 ctermfg=3

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

se nocul nocuc
set fillchars=diff:\ ,fold:\ ,stl:━,stlnc:━,vert:┃
set listchars=conceal:?,eol:$,extends:…,nbsp:¬,precedes:…,tab:├─
se ls=2
se mouse=ar
se nonu
se nowrap
se report=0
se ruler
se sc
se shm=atTAI
se siso=1
se sj=1
se smc=0
se so=999
se ss=1
se stal=0
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

se tags=./tags;,.git/tags;
se udf
let &udir = datadir . '/nvim/undo'

"" }}}

"" [ Vim Behaviour ] {{{

se ar
se bs=2
se cb=
se dip+=vertical
se hi=1000
se hid
se inex=substitute(substitute(v:fname,'\\','/','g'),'^/\\+','','')
se isf+=\
se lz
se ml
se path=**
se re=0
se timeout
se nottimeout
se tm=500
se ttm=20
se ve=all

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
se sr
se sta
se sts=8
se sw=4

"" }}}

"" [ Mappings ] {{{

let mapleader='\'

"" Backtick is ge, U is tilde
noremap ` ge
noremap ~ gE
onoremap ` ge
onoremap ~ gE
noremap U ~

"" Q closes windows; who needs Ex mode?
nno Q <C-W>c

"" Make <C-w>0 set a window's width to precisely as wide as the longest line in the buffer
nnoremap <expr> <C-w>0 max(map(getbufline('%',1,'$'),'len(v:val)'))."\<lt>C-w>\<Bar>"

"" Make <Backspace> operate on [count] like <Delete> does
noremap <expr> <BS> v:count ? "<Del>" : "<BS>"

"" Map ' and g' to ` and g`
noremap ' `
noremap g' g`

"" Make Y consistent with C and D
nno Y y$

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

"" Clear search highlighting
nno <Leader>/ :<C-U>noh<CR>

"" Display info about highlight group under cursor
nno <Leader>h :<C-U>echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"" }}}

"" [ Autocommands ] {{{

augroup MyAutocmds
  au!
  au BufWritePre,FileWritePre ?*
    \ if expand('<afile>') !~? '^[a-z0-9]\+:\/\/' |
        \ silent! call mkdir(expand('<afile>:h'), 'p') |
    \ endif
  au BufWritePre * let &bex=strftime(".%F.%T.vimbackup")
  au BufAdd ?* exe 'set sua+=.'.expand('<amatch>:e')
  au VimResized * wincmd =
  au CmdWinEnter * setlocal nonumber
  au BufWinEnter * if &previewwindow  | set winfixwidth winfixheight | endif
augroup END

"" }}}

"" Make important directories if they don't exist
for dir in [&bdir,&dir,&udir,&vdir,g:UltiSnipsSnippetsDir]
    if empty(finddir(dir))
        call mkdir(dir, 'p')
    endif
endfor
