function! s:config ()
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setlocal textwidth=80
  call setbufvar('%', '&filetype', getbufvar('#', '&filetype'))
endfunction

augroup ScratchBuffer
  autocmd!
  autocmd BufWinEnter * if expand('<afile>') ==# '' | call s:config() | endif
augroup END
