augroup ProjectionistEvents
  autocmd!
  autocmd User Projectionist* call s:Do(expand('<amatch>:t'))
  autocmd User ProjectionistActivate call s:activate()
augroup END

function! s:Do(op)
  silent! call function(&ft.'#'.a:op)()
endfunction

function! s:activate()

  "" set options
  for [root, options] in projectionist#query('options')
    for [key, val] in items(options)
      if getbufvar('%', '&'.key) !=# val
        call setbufvar('%', '&'.key, val)
        unlet key val
      endif
    endfor

    unlet root options
    break
  endfor

  "" set compiler
  for [root, compiler] in projectionist#query('compiler')
    silent! exe 'compiler' compiler
    unlet root compiler
    break
  endfor

endfunction
