" vim: set foldmethod=marker:
" Author: Quinn Strahl

let config_dir = expand('<sfile>:h')
let mapleader=' '

"" old habits die hard
map \ <Leader>

" ale {{{
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '!'
let g:ale_sign_info = 'i'
let g:ale_sign_style_error = g:ale_sign_error 
let g:ale_sign_style_warning = g:ale_sign_warning
" }}}
" delimitMate {{{
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_insert_eol_marker = 0
let g:delimitMate_jump_expansion = 1
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_excluded_regions = ""
" }}}
" deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
" }}}
" diffchar  {{{
let g:DiffPairVisible = 0
" }}}
" diff-enhanced {{{
let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=histogram")'
" }}}
" exchange {{{
let g:exchange_indent = 1
" }}}
" fzf {{{
nmap <Leader>f :<C-U>Files<CR>
let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
" }}}
" GV {{{
map <Leader>v :GV<CR>
" }}}
" javascript {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
" }}}
" jsx {{{
let g:jsx_ext_required = 0
" }}}
" localvimrc {{{
let g:localvimrc_ask = 0
" }}}
" netrw {{{
" just disable the damn thing
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
" }}}
" pandoc {{{
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#folding#fdc = 0
" }}}
" restore_view {{{
let g:skipview_files = ['COMMIT_EDITMSG', '\.git/\(\f*/\)*index']
" }}}
" solarized8 {{{
let g:solarized_use16 = 1
" }}}
" tern_for_vim {{{
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
" }}}
" ultisnips {{{
let g:UltiSnipsExpandTrigger = '<C-Space>'
let g:UltiSnipsListSnippets = '<Nop>'
let g:UltiSnipsJumpForwardTrigger = '<C-Space>'
let g:UltiSnipsJumpBackwardTrigger = '<C-S-Space>'
" }}}

" load plugins! {{{
let g:plug_window = '-tabnew'
exe 'source' config_dir . '/vim-plug/plug.vim'
call plug#begin(config_dir . '/bundle')

Plug 'junegunn/vim-plug'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'perrywky/vim-matchit'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'qstrahl/vim-matchmaker'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'tommcdo/vim-lion'
Plug 'tommcdo/vim-exchange'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-projectionist'
Plug 'leshill/vim-json'
Plug 'qstrahl/vim-dentures'
Plug 'wellle/targets.vim'
Plug 'PeterRincker/vim-argumentative'
Plug 'haya14busa/vim-asterisk'
Plug 'lifepillar/vim-solarized8'
Plug 'Raimondi/delimitMate'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }
Plug 'sickill/vim-pasta'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'justinmk/vim-dirvish'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'elixir-lang/vim-elixir'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jparise/vim-graphql'
Plug 'embear/vim-localvimrc'
Plug 'guns/vim-sexp' | Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-ragtag'
Plug 'romainl/vim-qf'
Plug 'stephenway/postcss.vim'
Plug 'leafgarland/typescript-vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-scripts/restore_view.vim'
Plug 'w0rp/ale'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'junegunn/gv.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'rickhowe/diffchar.vim'
Plug 'chrisbra/vim-diff-enhanced'

call plug#end()
" }}}

" options {{{
set clipboard=unnamedplus
set completeopt=menu,menuone
set diffopt=filler,vertical,foldcolumn:0
set expandtab
set fillchars=diff:╱,fold:-,vert:│
set foldlevelstart=99
set foldtext=foldtext#foldtext()
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250
set hidden
set ignorecase
set inccommand=nosplit
set mouse=a
set nowrap
set path=**
set pumheight=13
set report=0
set scrolloff=999
set shell=sh
set shiftwidth=2
set smartcase
set softtabstop=8
set splitbelow
set splitright
set textwidth=120
set undofile
set viewoptions=folds,cursor
set virtualedit=all
set wildignorecase
set wildmode=longest:full,full
" }}}
" maps {{{
"" tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-d>"

"" I'm slow to release shift :<
map <S-Space> <Space>
map! <S-Space> <Space>

"" visual diffget and diffput
vnoremap <expr> <C-D><C-O> ":" . (v:count ? v:count : '') . "diffget<CR>"
vnoremap <expr> <C-D><C-P> ":" . (v:count ? v:count : '') . "diffput<CR>"

"" toggle diffopt=iwhite a la vim-unimpaired
nnoremap [w :<C-U>set diffopt+=iwhite<CR>
nnoremap ]w :<C-U>set diffopt-=iwhite<CR>

"" sort visual selection
vnoremap <Leader>s :sort<CR>
vnoremap <Leader>S :sort n<CR>

"" Why would <C-BS> do anything other than <C-W> in insert mode?!
inoremap <C-BS> <C-W>

"" I like splitting
nnoremap _ <C-W>s
nnoremap \| <C-W>v
nnoremap <expr> +  "<C-W>s" . (v:count ? v:count : tabpagenr()) . "<C-W>T"

"" I like the home row
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

"" Backtick is ge, U is tilde
noremap ` ge
noremap ~ gE
onoremap ` ge
onoremap ~ gE
noremap U ~

"" Q closes windows; who needs Ex mode?
nnoremap Q <C-W>q

"" Map ' and g' to ` and g`
noremap ' `
noremap g' g`

"" Make Y consistent with C and D
nnoremap Y y$

"" Pull the line under the cursor into the command line
cnoremap <expr> <C-R><C-L> substitute(getline('.'), '^\s\+', '', '')

"" Text object meaning 'a fold'
vnoremap <expr> az &foldenable ? "V[zo]z" : ""
onoremap <expr> az "<C-c>" . (&foldenable ? "V[zo]z" . v:operator : "")

"" Clear formatting whitespace on the current line / selected region
nnoremap <silent> <Leader>w :s/\(^\s*\)\@<! \{2,}/ /ge<Bar>call histdel("search",-1)<Bar>let @/ = histget("search",-1)<CR>
vnoremap <silent> <Leader>w :s/\%V\(^\s*\)\@<! \{2,}\%V/ /ge<Bar>call histdel("search",-1)<Bar>let @/ = histget("search",-1)<CR>gv

"" Clear search highlighting
nnoremap <Leader>/ :<C-U>noh<CR>

"" Map for configuring fast
noremap <Leader>c :Config<CR>
" }}}
" commands {{{
command! Config exe 'keepalt -tabedit' resolve($MYVIMRC)
" }}}
" autocmds {{{
augroup MyAutocmds
  autocmd!
  autocmd BufAdd ?*.* exe 'set suffixesadd+=.'.expand('<amatch>:e')
  autocmd ColorScheme * silent runtime after/colors/<amatch>.vim
  autocmd VimResized * wincmd =
  autocmd TextChanged,TextChangedI,InsertLeave * silent! diffupdate
  autocmd Syntax * syntax sync fromstart
augroup END
" }}}
" colorscheme {{{
set background=dark
colorscheme solarized8
exe 'doautocmd ColorScheme' g:colors_name
" }}}
