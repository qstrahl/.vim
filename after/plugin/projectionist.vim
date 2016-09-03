augroup ProjectionistEvents
  autocmd!
  autocmd User Projectionist* call s:Do(expand('<amatch>:t'))
  autocmd User ProjectionistActivate call s:activate()
augroup END

augroup AutoMake
  autocmd!
augroup END

function! s:Do(op)
  silent! call function(&ft.'#'.a:op)()
endfunction

function! s:activate()
  for [root, value] in projectionist#query('make')
    if !empty(value)
      augroup AutoMake
        autocmd!
        autocmd AutoMake BufWritePost <buffer> if file_readable(expand('%:p')) | silent! lmake! %:p:S | endif
      augroup END
      unlet root value
      break
    endif
  endfor
endfunction
