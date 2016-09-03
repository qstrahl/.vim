let s:maxheight = 10

augroup QuickfixAutoWindow
  au!
  au QuickfixCmdPost [^l]* call s:AutoWindow('botright copen', 'cclose', 'getqflist')
  au QuickfixCmdPost l* call s:AutoWindow('rightbelow lopen', 'lclose', 'getloclist', 0)
  au BufWinEnter * if &buftype ==# 'quickfix' | call s:AutoSize() | endif
  au QuitPre * call s:QuitPre()
augroup END

function! s:AutoSize ()
  let list = getloclist(0)
  if empty(list)
    let list = getqflist()
  endif
  exe min([ len(list), s:maxheight ]) . 'wincmd _'
endfunction

function! s:AutoWindow (opencmd, closecmd, listfn, ...)
  let list = call(function(a:listfn), a:000)
  let listlen = len(list)
  if listlen > 0
    exe a:opencmd min([ listlen, s:maxheight ])
    wincmd p
  else
    exe a:closecmd
  endif
endfunction

function! s:QuitPre ()
  if &buftype != 'quickfix'
    silent! lclose
    if winnr('$') == 2
      silent! cclose
    endif
  endif
endfunction
