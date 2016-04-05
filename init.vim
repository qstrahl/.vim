"" vim: set fdm=marker:
"" Author: Quinn Strahl

"" I can't believe I have to do this
let datadir = ($XDG_DATA_HOME ? $XDG_DATA_HOME : $HOME) . '/.local/share/nvim'
let confdir = expand('<sfile>:h')
let initfile = expand('<sfile>')

"" Eclim {{{
let g:EclimCompletionMethod = 'omnifunc'
"" }}}

"" UltiSnips {{{
let g:UltiSnipsUsePythonVersion         = 2
let g:UltiSnipsEditSplit                = 'context'
let g:UltiSnipsSnippetsDir              = confdir . '/UltiSnips'
let g:UltiSnipsExpandTrigger            = '<Plug>(UltiSnipsExpandTrigger)'
let g:UltiSnipsListSnippets             = '<C-s>'
let g:UltiSnipsJumpForwardTrigger       = '<Plug>(UltiSnipsJumpForwardTrigger)'
let g:UltiSnipsJumpBackwardTrigger      = '<Plug>(UltiSnipsJumpBackwardTrigger)'
"" }}}

"" Syntastic {{{
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 4
let g:syntastic_error_symbol  = '✖'
let g:syntastic_style_error_symbol  = '✖'
let g:syntastic_warning_symbol  = '❢'
let g:syntastic_style_warning_symbol  = '❢'
let g:syntastic_ignore_files = ['/test/spec/']
"" }}}

"" YouCompleteMe {{{
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_key_invoke_completion = ''
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction
"" }}}

"" tern_for_vim {{{
let g:tern_show_signature_in_pum = 1

function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction
"" }}}

"" exchange {{{
let g:exchange_indent = 1
"" }}}

filetype off

"" Plugin management courtesy of vim-plug
source ~/.config/nvim/vim-plug/plug.vim
call plug#begin(confdir . '/bundle')

Plug 'junegunn/vim-plug', { 'dir': confdir. '/vim-plug' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'perrywky/vim-matchit'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'qstrahl/vim-matchmaker'
Plug 'qstrahl/vim-synergy'
Plug 'pangloss/vim-javascript', { 'branch': 'develop' }
Plug 'othree/html5.vim'
Plug 'tommcdo/vim-lion'
Plug 'scrooloose/syntastic'
Plug 'tommcdo/vim-exchange'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-projectile'
Plug 'tpope/vim-dispatch'
Plug 'leshill/vim-json'
Plug 'qstrahl/vim-ocd'
Plug 'qstrahl/vim-dentures'
Plug 'eiginn/netrw'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'PeterRincker/vim-argumentative'
Plug 'wellle/targets.vim'
Plug 'dahu/bisectly'
Plug 'haya14busa/vim-asterisk'
Plug 'altercation/vim-colors-solarized'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'do': function('BuildTern') }
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'sickill/vim-pasta'
Plug 'dansomething/vim-eclim'

call plug#end()

filetype plugin indent on
syntax on

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
set listchars=conceal:?,eol:$,extends:…,nbsp:¬,precedes:…,tab:▏\ 
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

set previewheight=15
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
se dip+=vertical,iwhite
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

"" Make <c-w>| and <c-w>_ cap out at the contained buffer's width and height by default
nnoremap <expr><silent> <C-w><Bar> (v:count ? v:count : max(map(getbufline('%',1,'$'),'len(v:val)')))."\<C-w>\<Bar>"
nnoremap <expr><silent> <C-w><C-\> (v:count ? v:count : max(map(getbufline('%',1,'$'),'len(v:val)')))."\<C-w>\<Bar>"
nnoremap <expr><silent> <C-w>_ (v:count ? v:count : line('$'))."\<C-w>_"
nnoremap <expr><silent> <C-w><C-_> (v:count ? v:count : line('$'))."\<C-w>_"

"" Make insert mode <C-y> and <C-e> do entire WORDs at a time
imap <expr> <C-y> substitute(getline(line('.')-1)[col('.')-1:],'\s\+\zs.*','','')
imap <expr> <C-e> substitute(getline(line('.')+1)[col('.')-1:],'\s\+\zs.*','','')

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

"" Clear formatting whitespace on the current line / selected region
nnoremap <silent> <Leader>w :s/\(^\s*\)\@<! \{2,}/ /ge<Bar>call histdel("search",-1)<Bar>let @/ = histget("search",-1)<CR>
vnoremap <silent> <Leader>w :s/\%V\(^\s*\)\@<! \{2,}\%V/ /ge<Bar>call histdel("search",-1)<Bar>let @/ = histget("search",-1)<CR>gv

"" Toggle BreakpointWindow (mnemonic: Breakpoint Browse)
nno <Leader>bb :<C-U>BreakpointWindow<CR>

"" Toggle Tagbar
nno <Leader>t :<C-U>TagbarToggle<CR>

"" Clear search highlighting
nno <Leader>/ :<C-U>noh<CR>

"" Display info about highlight group under cursor
nno <Leader>h :<C-U>echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"" }}}

command! Config exe 'edit' expand(initfile)
command! Sconfig exe 'split' expand(initfile)
command! Vconfig exe 'vsplit' expand(initfile)
command! Tconfig exe 'tabedit' expand(initfile)

"" [ Autocommands ] {{{

augroup AutoSource
  autocmd!
  autocmd BufWritePost init.vim,*/{autoload,indent,plugin}/*.vim silent! if fugitive#buffer().type() ==# 'file' | source <afile> | endif
augroup END

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
