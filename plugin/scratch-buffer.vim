function! g:OpenScratchBuffer ()
  let l:command = ":\<C-U>"
  let l:command .= 'new +'
  let l:command .= escape('setlocal buftype=nofile bufhidden=hide noswapfile tw=80', ' ')
  let l:command .= "\<CR>"

  return l:command
endfunction

nnoremap <expr> <silent> <Leader>s g:OpenScratchBuffer()
