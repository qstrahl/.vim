setglobal number

augroup SmartLineNumbers
  autocmd BufNew * if invert(index(['terminal', 'help'], &buftype)) | setlocal nonumber | endif
augroup END
