augroup QuickfixAutoWindow
  au!
  au QuickfixCmdPost [^l]* call s:AutoWindow('botright copen', 'cclose', 'getqflist')
  au QuickfixCmdPost l* call s:AutoWindow('rightbelow lopen', 'lclose', 'getloclist', 0)
  au QuitPre * silent! lclose | if winnr('$') == 2 | silent! cclose | endif
augroup END

function! s:AutoWindow (opencmd, closecmd, listfn, ...)
  let list = call(function(a:listfn), a:000)
  let listlen = len(list)
  if listlen
    exe a:opencmd min([ listlen, 10 ])
    wincmd p
    echohl MoreMsg
    echo listlen 'results' | echohl None
  else
    exe a:closecmd
    echohl WarningMsg
    echo 'No results' | echohl None
  endif
endfunction
