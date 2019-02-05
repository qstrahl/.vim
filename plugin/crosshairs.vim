augroup Crosshairs
  autocmd!
  autocmd WinLeave * call s:Remove()
  autocmd WinEnter * call s:Restore()
augroup END

function! s:Remove()
  if getwinvar(0, '&cursorline')
    let w:restore_cursorline = 1
    setlocal nocursorline
  endif
  if getwinvar(0, '&cursorcolumn')
    let w:restore_cursorcolumn = 1
    setlocal nocursorcolumn
  endif
endfunction

function! s:Restore()
  if get(w:, 'restore_cursorline')
    setlocal cursorline
    unlet w:restore_cursorline
  endif
  if get(w:, 'restore_cursorcolumn')
    setlocal cursorcolumn
    unlet w:restore_cursorcolumn
  endif
endfunction
