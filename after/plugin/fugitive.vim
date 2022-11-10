nnoremap gd <Cmd>Gdiffsplit!<CR>
nnoremap ge <Cmd>Gedit<CR>
nnoremap gl <Cmd>Gllog<CR>
nnoremap gs <Cmd>Git<CR>

function! s:cd ()
  let dir = FugitiveWorkTree()
  let [ cmd, dir ] = len(dir) ? ['tcd', dir] : ['lcd', getcwd(-1, -1)]
  exe cmd dir
endfunction

autocmd! BufEnter * call s:cd()
