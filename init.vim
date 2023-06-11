" vim: set foldmethod=marker:
" Author: Quinn Strahl

" options {{{
setglobal clipboard=unnamedplus
setglobal completeopt=menu,menuone,noselect
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
setglobal pumheight=15
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
setglobal textwidth=120
setglobal ttimeoutlen=-1
setglobal updatetime=1000
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
" asterisk {{{
let g:asterisk#keeppos = 1
" }}}
" exchange {{{
let g:exchange_indent = 1
" }}}
" lion {{{
let g:lion_squeeze_spaces = 1
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

  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'

  Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sleuth'
  Plug 'mbbill/undotree'
  Plug 'perrywky/vim-matchit'
  Plug 'tpope/vim-characterize'
  Plug 'tpope/vim-eunuch'
  Plug 'tommcdo/vim-lion'
  Plug 'tommcdo/vim-exchange'
  " Plug 'qstrahl/vim-dentures'
  Plug 'wellle/targets.vim'
  Plug 'haya14busa/vim-asterisk'
  Plug 'sickill/vim-pasta'
  Plug 'numToStr/Comment.nvim'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " We recommend updating the parsers on update

  "" Auto pair/close/tag
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'RRethy/nvim-treesitter-endwise'

  "" Autocompletion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp' 
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  "" Fuzzy Finding
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

  Plug 'anuvyklack/pretty-fold.nvim'

  Plug 'justinmk/vim-dirvish'
  Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
  Plug 'tpope/vim-scriptease'
  Plug 'romainl/vim-qf'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-obsession'

  Plug 'stevearc/dressing.nvim'
endif
call plug#end()
" }}}

colorscheme mine
