augroup SleuthCustom
  autocmd!
  autocmd BufNewFile,BufReadPost,BufFilePost * let &l:softtabstop = &l:tabstop
augroup END
