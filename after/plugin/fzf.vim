nmap <Leader><Tab> <Plug>(fzf-maps-n)
xmap <Leader><Tab> <Plug>(fzf-maps-x)
omap <Leader><Tab> <Plug>(fzf-maps-o)
imap <C-Tab> <Plug>(fzf-maps-i)

nmap <Leader><Leader> <Cmd>Commands<CR>
nmap <Leader>f <Cmd>Files<CR>
nmap <Leader>g <Cmd>GitFiles -co --exclude-standard<CR>
nmap <Leader>b <Cmd>Buffers<CR>

inoremap <silent> <C-S> <C-o>:Snippets<CR>
