setlocal textwidth=72
setlocal formatoptions+=t

if expand('%:t') =~# '^index$'
  setlocal cursorline

  augroup AutoSizeGitCommit
    autocmd!
    autocmd WinEnter,BufWinEnter,TextChanged <buffer> if &previewwindow | exe line('$') 'wincmd _' | endif
  augroup END
endif
