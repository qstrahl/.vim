augroup CustomFugitiveConfig
  autocmd!
  autocmd User Fugitive call s:DoStuff()
  autocmd TabNewEntered * silent! exe 'tcd' fugitive#repo().tree()
augroup END

function! s:DoStuff ()
  nnoremap <buffer> <Leader>gb :<C-U>Gblame<CR>
  nnoremap <buffer> <Leader>gd :<C-U>Gdiff<C-R>=v:count?' ~'.v:count :''<CR><CR>
  nnoremap <buffer> <Leader>ge :<C-U>Gedit<C-R>=v:count?' ~'.v:count :''<CR><CR>
  nnoremap <buffer> <Leader>gl :<C-U>Glog --<CR>
  nnoremap <buffer> <Leader>gr :<C-U>Glog<CR>
  nnoremap <buffer> <Leader>gs :<C-U>Gstatus<CR>
  exe 'tcd' fugitive#repo().tree()
endfunction
