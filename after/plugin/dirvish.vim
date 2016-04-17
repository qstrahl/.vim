augroup DirvishOnStart
  autocmd!
  autocmd VimEnter * if !argc() && !&modified | Dirvish | endif
augroup END
