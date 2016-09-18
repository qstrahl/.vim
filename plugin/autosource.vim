"" Automatically source vim files when written
augroup AutoSource
  autocmd!
  autocmd BufWritePost init.vim,*/{autoload,plugin}/*.vim silent! call s:Source(expand('<afile>'))
augroup END

function! s:Source (file)
  let file = fnamemodify(resolve(resolve(a:file)), ':p')
  if filereadable(file)
    exe 'source' file
  endif
endfunction
