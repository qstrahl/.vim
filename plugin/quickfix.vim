augroup QuickfixAutoOpen
  au!
  au QuickfixCmdPost [^l]* call s:AutoWindow('botright copen', 'cclose', 'getqflist')
  au QuickfixCmdPost l* call s:AutoWindow('rightbelow lopen', 'lclose', 'getloclist', 0)
augroup END

function! s:AutoWindow (opencmd, closecmd, listfn, ...)
  let list = call(function(a:listfn), a:000)
  let listlen = len(list)
  if listlen
    exe a:opencmd min([ listlen, 10 ])
    wincmd p
  else
    exe a:closecmd
  endif
endfunction
