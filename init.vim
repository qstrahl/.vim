" vim: set foldmethod=marker:
" Author: Quinn Strahl

" options {{{
setglobal clipboard=unnamedplus
setglobal completeopt=menu,menuone,noselect
setglobal diffopt=internal,inline:word,indent-heuristic,algorithm:patience,closeoff,hiddenoff,filler,vertical,foldcolumn:0,linematch:60
setglobal expandtab
setglobal fillchars=vert:\ ,fold:\ ,diff:╱
setglobal foldmethod=expr
setglobal foldlevelstart=99
setglobal guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250
setglobal helpheight=0
setglobal hidden
setglobal ignorecase
setglobal inccommand=nosplit
setglobal mouse=ar
setglobal nostartofline
setglobal notermguicolors
setglobal nowrap
setglobal path=**
setglobal previewheight=9
setglobal pumheight=15
setglobal redrawtime=10000
setglobal report=0
setglobal scrolloff=0
setglobal shada=!,%,'99999,h,r/tmp,r*/COMMIT_EDITMSG
setglobal shell=/usr/bin/env\ sh
setglobal shiftwidth=2
setglobal showtabline=1
setglobal smartcase
setglobal softtabstop=8
setglobal splitbelow
setglobal splitright
setglobal textwidth=120
" setglobal ttimeoutlen=-1 "" ttimeoutlen=-1 seems to interfere with OSC52
setglobal updatetime=1000
setglobal virtualedit=block
setglobal wildignorecase
setglobal wildmode=longest:full,full
setglobal winminheight=0
setglobal winminwidth=0

" let &termguicolors = $TERM =~ 'tmux\|xterm'

let g:clipboard="osc52"
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
" let g:netrw_banner = 0
" let g:netrw_list_hide = '\v^\.\.?/'
" let g:netrw_liststyle = 1
" let g:netrw_sort_sequence = '\/'
" let g:netrw_bufsettings = 'noma nomod nonu nowrap ro nornu nobl bh=unload'
" let g:netrw_fastbrowse = 2
" }}}
" qf (quickfix) {{{
let g:qf_mapping_ack_style = 1
let g:qf_loclist_window_bottom = 0
" }}}
" ragtag {{{
let g:ragtag_global_maps = 1
" }}}
" load plugins! {{{
let s:install_plugins = 0
let g:plug_window = '-tabnew'
let s:plug_dir = stdpath('data') . '/plugged'
let s:plug_path = s:plug_dir . '/vim-plug/plug.vim'
silent! exe 'source' s:plug_path
try | call plug#begin(s:plug_dir)
catch /^Vim(call):E117/
  let s:plug_git = 'https://github.com/junegunn/vim-plug.git'
  silent exe '!git clone --depth 1' s:plug_git  s:plug_dir . '/vim-plug'
  silent exe 'source' s:plug_path
  let s:install_plugins = 1
  call plug#begin(s:plug_dir)
endtry

if &loadplugins
  Plug 'junegunn/vim-plug'

  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'folke/neodev.nvim'

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
  Plug 'haya14busa/vim-asterisk'
  Plug 'sickill/vim-pasta'
  Plug 'numToStr/Comment.nvim'

  Plug 'nvim-treesitter/nvim-treesitter', {'branch': 'main', 'do': ':TSUpdate'} " We recommend updating the parsers on update

  "" Auto pair/close/tag
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'brianhuster/treesitter-endwise.nvim'
  " Plug 'RRethy/nvim-treesitter-endwise' " consider switching back if/when compatible with nvim-treesitter@main

  "" More treesitter-based plugins
  Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'branch': 'main'}
  Plug 'Wansmer/treesj'

  "" Autocompletion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp' 
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  Plug 'copilotlsp-nvim/copilot-lsp'
  Plug 'zbirenbaum/copilot.lua' 
  Plug 'zbirenbaum/copilot-cmp'

  "" Fuzzy Finding
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'LinArcX/telescope-scriptnames.nvim'
  Plug 'nvim-telescope/telescope-github.nvim'

  Plug 'stevearc/oil.nvim'
  Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
  Plug 'tpope/vim-scriptease'
  Plug 'romainl/vim-qf'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-obsession'

  Plug 'stevearc/dressing.nvim'
endif
call plug#end()

if s:install_plugins
  PlugInstall
endif
" }}}

colorscheme mine
