augroup ProjectionistEvents
  autocmd!
  autocmd User Projectionist* call s:Do(expand('<amatch>:t'))
augroup END

function! s:Do(op)
  silent! call function(&ft.'#'.a:op)()
endfunction
