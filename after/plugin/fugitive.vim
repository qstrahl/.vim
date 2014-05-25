augroup CustomFugitiveConfig
    au!
    au BufEnter,FileType,BufNew,BufWinEnter,WinEnter * if exists(':Glcd') | Glcd | endif
    au User Fugitive
        \ nno <buffer> <Leader>gb :<C-U>Gblame<CR>|
        \ nno <buffer> <Leader>gd :<C-U>Gdiff<C-R>=v:count?' ~'.v:count :''<CR><CR>|
        \ nno <buffer> <Leader>ge :<C-U>Gedit<C-R>=v:count?' ~'.v:count :''<CR><CR>|
        \ nno <buffer> <Leader>gl :<C-U>Glog --<CR>|
        \ nno <buffer> <Leader>gr :<C-U>Glog<CR>|
        \ nno <buffer> <Leader>gs :<C-U>Gstatus<CR>|
augroup END
