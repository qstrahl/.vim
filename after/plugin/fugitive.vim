function! s:count (target)
  return v:count ? printf(a:target, v:count) : ''
endfunction

nnoremap gd <Cmd>exe 'Gvdiffsplit!' <SID>count('@~%d')<CR>
nnoremap ge <Cmd>exe 'Gedit' <SID>count('@~%d')<CR>
nnoremap gl <Cmd>exe '0Gllog' <SID>count('@~%d..')<CR>
nnoremap gL <Cmd>exe 'Gclog' <SID>count('@~%d..')<CR>
nnoremap gs <Cmd>Gedit :<CR>

xnoremap gl <Cmd>exe "'<,'>Gllog" <SID>count('@~%d..')<CR>

function! s:cd ()
  let dir = FugitiveWorkTree()
  let [ cmd, dir ] = len(dir) ? ['tcd', dir] : ['lcd', getcwd(-1, -1)]
  exe cmd dir
endfunction

autocmd! BufEnter * call s:cd()
