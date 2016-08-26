function! s:config ()
  let buf = bufnr('%')
  let file = expand('%')

  if !empty(&buftype . file)
    return
  endif

  setlocal buftype=nofile
  setlocal textwidth=80

endfunction

augroup ScratchBuffer
  autocmd!
  autocmd BufAdd * autocmd BufWinEnter <buffer=abuf> call s:config()
  autocmd BufWinEnter * autocmd! ScratchBuffer BufWinEnter <buffer>
augroup END
