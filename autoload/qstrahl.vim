"" A nicer bufname()
function! qstrahl#bufname (...)
  let buf = get(a:, 1, '')
  let name = bufname(buf)

  "" Remove long fugitive prefixes
  let name = substitute(name,
    \ '\v^fugitive://.+//([^/]+)(.*)',
    \ '\="git://" . strpart(submatch(1), 0, 7) . submatch(2)',
    \ name
  \ )

  let name = fnamemodify(name, ':~:.')

  if empty(name)
    let name = getbufvar(buf, 'netrw_curdir')
  endif

  return name
endfunction

function! qstrahl#modified (...)
  let buf = get(a:, 1, '')
  let modifiable = getbufvar(buf, '&modifiable')
  
  if !modifiable
    return ''
  endif

  let modified = getbufvar(buf, '&modified')

  if modified
    return '*'
  else
    return ''
  endif
endfunction
