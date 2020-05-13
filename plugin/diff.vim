" visual diffget and diffput
xnoremap <expr> <C-D><C-O> ":" . (v:count ? v:count : '') . "diffget<CR>"
xnoremap <expr> <C-D><C-P> ":" . (v:count ? v:count : '') . "diffput<CR>"

" toggle diffopt=iwhite a la vim-unimpaired (I don't care about wrapping)
nnoremap [ow <Cmd>set dip+=iwhite<CR>
nnoremap ]ow <Cmd>set dip-=iwhite<CR>
nnoremap yow <Cmd>exe printf('set dip%s=iwhite', '+-'[&dip=~'\v<iwhite>'])<CR>
