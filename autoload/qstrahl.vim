"" A nicer bufname()
function! qstrahl#bufname (buf)
  let l:name = bufname(a:buf)

  "" Remove long fugitive prefixes
  let l:name = substitute(l:name,
    \ '\v^fugitive://.+//([^/]+)(.*)',
    \ '\="git://" . strpart(submatch(1), 0, 7) . submatch(2)',
    \ ''
  \ )

  return fnamemodify(name, ':~:.')
endfunction
