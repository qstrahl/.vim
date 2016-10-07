augroup CustomFugitiveConfig
  autocmd!
  autocmd User Fugitive call s:DoStuff()
  autocmd VimEnter * if tabpagenr('$') > 1 | exe 'tabdo call fugitive#detect(@%) | tabnext' tabpagenr() | endif
augroup END

function! s:DoStuff ()
  nnoremap <buffer> gd :<C-U>Gdiff<C-R>=v:count?' ~'.v:count :''<CR><CR>
  nnoremap <buffer> ge :<C-U>Gedit<C-R>=v:count?' ~'.v:count :''<CR><CR>
  nnoremap <buffer> gs :<C-U>Gstatus<CR>

  if exists(':Glcd')
    augroup AutoGlcd
      autocmd!
      autocmd BufWinEnter <buffer> Glcd
    augroup END
  endif
endfunction
