augroup AutoMkdir
  autocmd!
  autocmd VimEnter * call s:MakeDirs()
augroup END

function! s:MakeDirs ()
  "" Make important directories if they don't exist
  for dir in [&bdir,&dir,&udir,&vdir,g:UltiSnipsSnippetsDir]
    if empty(finddir(dir))
      call mkdir(dir, 'p')
    endif
  endfor
endfunction
