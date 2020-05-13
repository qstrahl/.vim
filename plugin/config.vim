function! s:config ()
  badd $MYVIMRC
  let rcbuf = bufnr($MYVIMRC)
  let name = bufname('')
  let s:tab = &buflisted && len(name) || &modified || len(&buftype)
  exe s:tab ? '-tab sb' : 'b' rcbuf
endfunction

command! Config exe <SID>config()

noremap <Leader>c <Cmd>Config<CR>
