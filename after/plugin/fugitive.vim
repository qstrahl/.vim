nnoremap <Leader>gd <Cmd>Gdiffsplit!<CR>
nnoremap <Leader>ge <Cmd>Gedit<CR>
nnoremap <Leader>gl <Cmd>Gllog<CR>
nnoremap <Leader>gs <Cmd>Git<CR>

function! s:cd ()
  let dir = FugitiveWorkTree()
  let [ cmd, dir ] = len(dir) ? ['tcd', dir] : ['lcd', getcwd(-1, -1)]
  exe cmd dir
endfunction

autocmd! BufEnter * call s:cd()
