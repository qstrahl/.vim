nnoremap <Leader>gd <Cmd>Gdiffsplit!<CR>
nnoremap <Leader>ge <Cmd>Gedit<CR>
nnoremap <Leader>gl <Cmd>Gllog<CR>
nnoremap <Leader>gs <Cmd>Git<CR>

nnoremap <Leader>gD <Cmd>Git difftool -y<CR>
nnoremap <Leader>gm <Cmd>Git mergetool -y<CR>

function! s:cd ()
  let dir = FugitiveWorkTree()
  let [ cmd, dir ] = len(dir) ? ['tcd', dir] : ['lcd', getcwd(-1, -1)]
  exe cmd dir
endfunction

autocmd! BufEnter * call s:cd()
