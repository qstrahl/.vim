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

  "" set compiler
  for [root, compiler] in projectionist#query('compiler')
    silent! exe 'compiler' compiler
    unlet root compiler
    break
  endfor

endfunction
