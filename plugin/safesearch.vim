"" safesearch: start a search in vim without overwriting the last pattern
"" trivial? Yup. Useful? Ehhh maybe.

function! s:SafeSearch ()
  augroup SafeSearch
    autocmd CursorMoved,CursorMovedI,InsertEnter,CursorHold,CursorHoldI,CmdWinEnter,CmdWinLeave,WinEnter,WinLeave * call <SID>Teardown()
  augroup END
  return '/'
endfunction

function! s:Teardown()
  call histdel('search', -1)
  let @/ = histget('search', -1)
  augroup SafeSearch
    autocmd!
  augroup END
endfunction

noremap <expr> <Plug>(SafeSearch) <SID>SafeSearch()
map gj <Plug>(SafeSearch)
