" Home row window management
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-n> gt
nnoremap <M-p> gT

" Break window into its own tabbpage
nnoremap <C-w><C-CR> <Cmd>-tab sp<CR>

noremap! <C-v> <C-r>+

" Okay... okay hear me out... it makes sense, okay?
imap <C-o> <S-Tab>
cmap <C-i> <Down>
cmap <C-o> <Up>

" I like the home row
map! <C-j> <C-n>
map! <C-k> <C-p>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <expr> <C-j> wildmenumode() ? "<C-n>" : "<Down>"
cnoremap <expr> <C-k> wildmenumode() ? "<C-p>" : "<Up>"

" I REALLY like the home row
map <C-j> <C-n>
map <C-k> <C-p>

" I'm slow to release shift :<
map <S-Space> <Space>
map! <S-Space> <Space>

" Why not
map <S-BS> <Delete>
map! <S-BS> <Delete>

" I like splitting
nnoremap _ <C-w>s
nnoremap <C--> <C-w>s
nnoremap <Bar> <C-w>v
nnoremap <C-Bslash> <C-w>v
nnoremap <expr> +  "<C-w>s" . (v:count ? v:count : tabpagenr()) . "<C-w>T"

" zen - obliviate all distractions
nnoremap Z zMzxzz

" toggle window 'zoom'
" nnoremap <Leader>z <Cmd>
"       \ let [&winheight, &winwidth, &equalalways] =
"       \ (&equalalways ? [999, 999, 0] : [1, 1, 1])
"       \ <CR>

" Why would <C-BS> do anything other than <C-w> in insert mode?!
noremap! <C-BS> <C-w>

" Backtick is ge, U is tilde
noremap ` ge
noremap ~ gE
onoremap ` ge
onoremap ~ gE
noremap U ~

" Q closes windows; who needs Ex mode?
nnoremap Q <C-w>q
nnoremap <C-q> <C-v>

" I don't ever really want to jump to an unmarked column on a marked line
noremap ' `
noremap g' g`

" Make Y consistent with C and D
nnoremap Y y$

" Clear search highlighting
noremap <C-/> <Cmd>noh<CR>
ounmap <C-/>
inoremap <C-/> <Cmd>noh<CR>
noremap <Leader>/ <Cmd>noh<CR>
ounmap <Leader>/

" I want a faster map for going to previous window more than I want c-w c-w
nnoremap <C-w><C-w> <C-w><C-p>

" TOOD: make an omap that automatically macros? Or something?
" onoremap q
