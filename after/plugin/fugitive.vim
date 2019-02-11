augroup CustomFugitiveConfig
  autocmd!
  autocmd User Fugitive call s:DoStuff()
  autocmd BufWinEnter * if (!isdirectory(expand('<amatch>')) && exists(':Glcd')) | Glcd | endif
  autocmd VimEnter * if tabpagenr('$') > 1 | exe 'tabdo call fugitive#detect(@%) | tabnext' tabpagenr() | endif
  autocmd BufWinEnter * if get(b:, 'fugitive_type', '') ==# 'index' | call s:SetupGitIndex() | endif
augroup END

function! s:SetupGitIndex ()
  exe 'resize' line('$')
  exe "normal \<C-n>"
  setlocal winfixheight cursorline
  map <buffer> j <C-n>
  map <buffer> k <C-p>

  augroup CustomFugitiveGitStatus
    autocmd!
    autocmd TextChanged <buffer=abuf> exe 'resize' line('$')
    autocmd BufLeave <buffer=abuf> if bufnr(0) == expand('<abuf>') | set winfixheight< cursorline< | wincmd = | endif
    autocmd WinLeave <buffer=abuf> exe 'resize' line('$')
  augroup END
endfunction

function! s:DoStuff ()
  nnoremap <buffer> <Leader>d :<C-U>Gdiff<C-R>=v:count?' ~'.v:count :''<CR><CR>
  nnoremap <buffer> <Leader>e :<C-U>Gedit<C-R>=v:count?' ~'.v:count :''<CR><CR>
  nnoremap <buffer> <Leader>l :<C-U>0Glog<C-R>=v:count?' HEAD~'.v:count.'..' :''<CR><CR>
  nnoremap <buffer> <Leader>s :<C-U>botright Gstatus<CR>

  vnoremap <buffer> <Leader>l :Glog<C-R>=v:count?' HEAD~'.v:count.'..' :''<CR><CR>

  "" FZF integration
  if exists(':GitFiles')
    nmap <buffer> <Leader>g :<C-U>GitFiles<CR>
  endif
endfunction
