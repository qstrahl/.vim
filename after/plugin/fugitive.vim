augroup CustomFugitiveConfig
  autocmd!
  autocmd User Fugitive call s:DoStuff()
  autocmd VimEnter * if tabpagenr('$') > 1 | exe 'tabdo call fugitive#detect(@%) | tabnext' tabpagenr() | endif
augroup END

function! s:DoStuff ()
  nnoremap <buffer> <Leader>gb :<C-U>Gblame<CR>
  nnoremap <buffer> <Leader>gd :<C-U>Gdiff<C-R>=v:count?' ~'.v:count :''<CR><CR>
  nnoremap <buffer> <Leader>ge :<C-U>Gedit<C-R>=v:count?' ~'.v:count :''<CR><CR>
  nnoremap <buffer> <Leader>gl :<C-U>Glog --<CR>
  nnoremap <buffer> <Leader>gr :<C-U>Glog<CR>
  nnoremap <buffer> <Leader>gs :<C-U>Gstatus<CR>

  Glcd
  Gtcd
  autocmd BufWinEnter,BufEnter <buffer> Glcd | Gtcd
endfunction
