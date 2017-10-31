augroup Crosshairs
  autocmd!
  autocmd BufLeave,WinLeave,BufWinLeave * call s:Remove()
  autocmd BufEnter,WinEnter,BufWinEnter * call s:Restore()
augroup END

function! s:Remove()
  if getwinvar(0, '&cursorline')
    let b:restore_cursorline = 1
    setlocal nocursorline
  endif
  if getwinvar(0, '&cursorcolumn')
    let b:restore_cursorcolumn = 1
    setlocal nocursorcolumn
  endif
endfunction

function! s:Restore()
  if get(b:, 'restore_cursorline')
    setlocal cursorline
    unlet b:restore_cursorline
  endif
  if get(b:, 'restore_cursorcolumn')
    setlocal cursorcolumn
    unlet b:restore_cursorcolumn
  endif
endfunction
