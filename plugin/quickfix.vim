let s:maxheight = 10

let s:signs = { 'e': 'error', 'w': 'warning', 'i': 'info', 'm': 'msg' }
let s:default_sign = 'error'

sign define error text=✖ texthl=SignError
sign define warning text=• texthl=SignWarning
sign define info text=ℹ texthl=SignInfo

hi SignError ctermfg=1 ctermbg=0
hi SignWarning ctermfg=3 ctermbg=0
hi SignInfo ctermfg=4 ctermbg=0

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
    call s:AutoSigns(list)
    exe a:opencmd min([ listlen, s:maxheight ])
    wincmd p
  else
    exe 'sign unplace * buffer='.bufnr('%')
    exe a:closecmd
  endif
endfunction

function! s:AutoSigns (list)
  for item in a:list
    exe 'sign unplace * buffer=' . item.bufnr
    unlet item
  endfor

  let id = 5000
  for item in a:list
    let id += 1
    let line = get(item, 'lnum')
    let name = get(s:signs, tolower(get(item, 'type')), s:default_sign)
    let buffer = get(item, 'bufnr')
    let g:foo = 'sign place '.(id).' line='.(line).' name='.(name).' buffer='.(buffer)
    exe g:foo
  endfor
endfunction

function! s:QuitPre ()
  if &buftype != 'quickfix'
    silent! lclose
    if winnr('$') == 2
      silent! cclose
    endif
  endif
endfunction
