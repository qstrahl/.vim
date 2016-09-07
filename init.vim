"" vim: set fdm=marker:
"" Author: Quinn Strahl

filetype off

let confdir = expand('<sfile>:h')

"" ctrlp {{{
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\v[\/](coverage|dist|node_modules|bower_components|vendor)$'
let g:ctrlp_user_command = 'git ls-files -c -o --exclude-standard 2>/dev/null || find %s -type f 2>/dev/null'
let g:ctrlp_map =''
nmap <C-p> <Plug>(ctrlp)
" let g:ctrlp_user_command = {
"   \ 'types': {
"     \ 1: ['.git', 'git ls-files -c -o --exclude-standard'],
"   \ },
"   \ 'fallback': 'find %s -type f',
"   \ 'ignore': 1
"   \ }
"" }}}

"" deoplete {{{
let g:deoplete#enable_at_startup = 1
"" }}}

"" dirvish {{{
augroup DirvishOnStart
  autocmd!
  autocmd VimEnter * if !argc() && !&modified | exe 'Dirvish' | endif
augroup END

nmap - <Plug>(dirvish_up)
nmap _ <C-W>s<Plug>(dirvish_up)
nmap \| <C-W>v<Plug>(dirvish_up)
nmap + :<C-U>-tabedit %<CR><Plug>(dirvish_up)
"" }}}

"" eclim {{{
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimFileTypeValidate = 0
let g:EclimJavaValidate = 0
let g:EclimJavascriptValidate = 0
let g:EclimHtmlValidate = 0
let g:EclimShowCurrentError = 0
"" }}}

"" exchange {{{
let g:exchange_indent = 1
"" }}}

"" javascipt {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
"" }}}

"" jsx {{{
let g:jsx_ext_required = 0
"" }}}

"" neomake {{{
" augroup MyNeomake
"   autocmd!
"   autocmd BufWritePost * Neomake
" augroup END

let g:neomake_open_list = 2
"" }}}

"" netrw {{{
"" just disable the damn thing
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
"" }}}

"" tern {{{
let g:tern_show_signature_in_pum = 1

function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction
"" }}}

"" ultisnips {{{
let g:UltiSnipsUsePythonVersion         = 2
let g:UltiSnipsEditSplit                = 'context'
let g:UltiSnipsSnippetsDir              = confdir . '/UltiSnips'
let g:UltiSnipsExpandTrigger            = '<Plug>(UltiSnipsExpandTrigger)'
let g:UltiSnipsListSnippets             = '<C-s>'
let g:UltiSnipsJumpForwardTrigger       = '<Plug>(UltiSnipsJumpForwardTrigger)'
let g:UltiSnipsJumpBackwardTrigger      = '<Plug>(UltiSnipsJumpBackwardTrigger)'
"" }}}

"" Source custom plugins first
runtime! plugin/*.vim

"" Plugin management courtesy of vim-plug

let g:plug_window = '-tabnew'
source ~/.config/nvim/vim-plug/plug.vim
call plug#begin(expand('<sfile>:h').'/bundle')

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
Plug 'pangloss/vim-javascript', { 'branch': 'develop' }
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'tommcdo/vim-lion'
Plug 'neomake/neomake'
Plug 'tommcdo/vim-exchange'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-projectionist'
Plug 'leshill/vim-json'
Plug 'qstrahl/vim-dentures'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'wellle/targets.vim'
Plug 'PeterRincker/vim-argumentative'
Plug 'haya14busa/vim-asterisk'
Plug 'altercation/vim-colors-solarized'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'do': function('BuildTern') }
Plug 'sickill/vim-pasta'
" Plug 'dansomething/vim-eclim'
Plug 'Shougo/deoplete.nvim'
Plug 'justinmk/vim-dirvish'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'JulesWang/css.vim' | Plug 'hail2u/vim-css3-syntax'

call plug#end()

filetype plugin indent on
syntax on

"" Colorscheme

set background=dark
colorscheme solarized
exe 'doautocmd ColorScheme' g:colors_name
