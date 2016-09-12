let mapleader='\'

"" gm makes
nnoremap gm :<C-U>silent lmake %:p:S<CR>

"" Backtick is ge, U is tilde
noremap ` ge
noremap ~ gE
onoremap ` ge
onoremap ~ gE
noremap U ~

"" Q closes windows; who needs Ex mode?
nnoremap Q <C-W>q

"" Make <c-w>| and <c-w>_ cap out at the contained buffer's width and height by default
nnoremap <expr><silent> <C-w><Bar> (v:count ? v:count : max(map(getline(1,'$'),'virtcol([v:key+1,"$"])'))-1)."\<C-w>\<Bar>"
nnoremap <expr><silent> <C-w><C-\> (v:count ? v:count : max(map(getline(1,'$'),'virtcol([v:key+1,"$"])'))-1)."\<C-w>\<Bar>"
nnoremap <expr><silent> <C-w>_ (v:count ? v:count : float2nr(ceil(eval(join(map(getline(1,'$'),'max([winwidth(0),virtcol([v:key+1,"$"])])'),'+'))/str2float(winwidth(0).'.0'))))."\<C-w>_"
nnoremap <expr><silent> <C-w><C-_> (v:count ? v:count : float2nr(ceil(eval(join(map(getline(1,'$'),'max([winwidth(0),virtcol([v:key+1,"$"])])'),'+'))/str2float(winwidth(0).'.0'))))."\<C-w>_"

"" Make insert mode <C-y> and <C-e> do entire WORDs at a time
inoremap <expr> <C-y> substitute(getline(line('.')-1)[col('.')-1:],'\s\+\zs.*','','')
inoremap <expr> <C-e> substitute(getline(line('.')+1)[col('.')-1:],'\s\+\zs.*','','')

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
