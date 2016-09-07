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
  for [root, value] in projectionist#query('compiler')
    if !empty(value)
      let compiler = value
      silent! exe 'compiler' compiler
      unlet root value
      break
    endif
  endfor

endfunction
