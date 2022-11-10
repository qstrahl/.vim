" vim: set foldmethod=marker:
" Author: Quinn Strahl

" options {{{
setglobal clipboard=unnamedplus
setglobal completeopt=menu,menuone
setglobal diffopt=internal,indent-heuristic,algorithm:histogram,closeoff,hiddenoff,filler,vertical,iwhite,foldcolumn:0
setglobal expandtab
setglobal fillchars=vert:\ ,diff:╱,fold:-
setglobal foldlevelstart=99
setglobal guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250
setglobal hidden
setglobal ignorecase
setglobal inccommand=nosplit
setglobal mouse=ar
setglobal nostartofline
setglobal nowrap
setglobal path=**
setglobal pumheight=13
setglobal redrawtime=10000
setglobal report=0
setglobal scrolloff=0
setglobal shada=!,%,'999,h,r/tmp,r*/COMMIT_EDITMSG
setglobal shell=/usr/bin/env\ sh
setglobal shiftwidth=2
setglobal showtabline=1
setglobal smartcase
setglobal softtabstop=8
setglobal splitbelow
setglobal splitright
" setglobal statusline=%!statusline#render()
" setglobal tabline=%!tabline#render()
setglobal textwidth=120
setglobal ttimeoutlen=-1
setglobal virtualedit=block
setglobal wildignorecase
setglobal wildmode=longest:full,full
setglobal winminheight=0

setglobal winminwidth=0

" let &termguicolors = $TERM =~ 'tmux\|xterm'

let g:mapleader="\<Space>"
let g:maplocalleader='\'
" }}}
" Initialization / plugin system setup {{{
" automatic auto-grouping for your autocommands!
let $CONFIG = resolve(stdpath('config'))
let s:augroupidx = len($CONFIG) + 1
function! s:augroup ()
  exe 'augroup' expand('<afile>:p:r')[s:augroupidx:]
  autocmd!
endfunction
augroup init
  autocmd! init SourcePre $CONFIG/* call s:augroup()
augroup END
" }}}
" ale {{{
let g:ale_set_loclist = 0
let g:ale_sign_error = '×'
let g:ale_sign_warning = '!'
let g:ale_sign_info = 'i'
let g:ale_sign_style_error = g:ale_sign_error 
let g:ale_sign_style_warning = g:ale_sign_warning
" }}}
" asterisk {{{
let g:asterisk#keeppos = 1
" }}}
" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}
" diffchar  {{{                                 
let g:DiffPairVisible = 0                       
" }}}                                           
" easy_align {{{
let g:easy_align_bypass_fold = 1
" }}}
" exchange {{{
let g:exchange_indent = 1
" }}}
" fzf {{{
let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
" }}}
" GV {{{
" }}}
" LanguageClient-neovim {{{
let g:LanguageClient_serverCommands = {
      \ 'javascript': ['javascript-typescript-langserver', '-l', '.javascript-typescript-langserver.log'],
      \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
\ }
" }}}
" lion {{{
let g:lion_squeeze_spaces = 1
let g:lion_map_right = 'glr'
let g:lion_map_left = 'gll'
" }}}
" netrw {{{
" just disable the damn thing
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
" }}}
" qf (quickfix) {{{
let g:qf_mapping_ack_style = 1
let g:qf_loclist_window_bottom = 0
" }}}
" ragtag {{{
let g:ragtag_global_maps = 1
" }}}
" ultisnips {{{
let g:UltiSnipsExpandTrigger = "\<Nop>" " I prefer to use :Snippets from FZF
let g:UltiSnipsListSnippets = "\<Nop>"
let g:UltiSnipsJumpForwardTrigger = "\<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "\<S-Tab>"
" }}}
" load plugins! {{{
let g:plug_window = '-tabnew'
let s:plug_dir = stdpath('data') . '/plugged'
silent! exe 'source' s:plug_dir . '/vim-plug/plug.vim'
try | call plug#begin(s:plug_dir)
catch /^Vim(call):E117/
  let s:plug_git = 'https://github.com/junegunn/vim-plug.git'
  silent exe '!git clone --depth 1' s:plug_git  s:plug_dir . '/vim-plug'
  call plug#begin(s:plug_dir)
endtry

if &loadplugins
  Plug 'junegunn/vim-plug'
  Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-sleuth'
  Plug 'mbbill/undotree'
  Plug 'perrywky/vim-matchit'
  Plug 'tpope/vim-characterize'
  Plug 'tpope/vim-eunuch'
  " Plug 'qstrahl/vim-matchmaker'
  " Plug 'tommcdo/vim-lion'
  " Plug 'tommcdo/vim-exchange'
  Plug 'qstrahl/vim-dentures'
  Plug 'wellle/targets.vim'
  Plug 'haya14busa/vim-asterisk'
  Plug 'sickill/vim-pasta'
  " Plug 'SirVer/ultisnips'
  Plug 'jiangmiao/auto-pairs'
  " Plug 'honza/vim-snippets'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'justinmk/vim-dirvish'
  Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-scriptease'
  Plug 'romainl/vim-qf'
  Plug 'AndrewRadev/splitjoin.vim'
  " Plug 'dense-analysis/ale'
  " Plug 'junegunn/gv.vim'
  Plug 'junegunn/vim-easy-align'
  " Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
  " Plug 'rickhowe/diffchar.vim'
  " Plug 'sheerun/vim-polyglot'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'tpope/vim-ragtag'
endif
call plug#end()
" }}}

colorscheme mine
