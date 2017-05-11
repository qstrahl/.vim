augroup CustomFugitiveConfig
  autocmd!
  autocmd User Fugitive call s:DoStuff()
  autocmd VimEnter * if tabpagenr('$') > 1 | exe 'tabdo call fugitive#detect(@%) | tabnext' tabpagenr() | endif
augroup END

function! s:DoStuff ()
  nnoremap <buffer> <Leader>d :<C-U>Gdiff<C-R>=v:count?' ~'.v:count :''<CR><CR>
  nnoremap <buffer> <Leader>e :<C-U>Gedit<C-R>=v:count?' ~'.v:count :''<CR><CR>
  nnoremap <buffer> <Leader>s :<C-U>Gstatus<CR>

  if exists(':Glcd')
    augroup AutoGlcd
      autocmd!
      autocmd BufWinEnter <buffer> Glcd
    augroup END
  endif

  "" FZF integration
  if exists(':GitFiles')
    nmap <buffer> <Leader>g :<C-U>GitFiles<CR>
  endif
endfunction
