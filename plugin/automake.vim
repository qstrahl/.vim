function! s:AutoMake (file)
  if file_readable(a:file) && !empty(getbufvar(a:file, '&l:makeprg'))
    exe 'silent! lmake!' fnamemodify(a:file, ':S')
  endif
endfunction

augroup AutoMake
  autocmd!
  " autocmd BufWritePost * call s:AutoMake(expand('<afile>:p'))
augroup END
