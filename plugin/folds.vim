function! MyFoldtext ()
  if &foldmethod ==# 'syntax'
    let s = s:leader()
    let num = v:foldend - v:foldstart
    let lines = filter(range(v:foldstart, v:foldend), 'indent(v:val) == indent(v:foldstart)')
    let s .= join(map(lines, 's:trim(getline(v:val))'), '…')
    let s .= ' '
    let s .= printf(&commentstring, ' ' . num . ' lines folded ')
  else
    let s = foldtext()
    let s = substitute(s, '\v.{-}(\d* lines):\s*(.*)', '\=s:trim(printf("%s " . &commentstring, submatch(2), " " . submatch(1) . " folded "))', '')
    let s = s:leader() . s
  endif
  if s[strlen(s)-1] !=# ' '
    let s .= ' '
  endif
  return s
endfunction!

function! s:leader ()
  return substitute(repeat('┄', indent(v:foldstart)), '\v.$', ' ', '')
endfunction

function! s:trim (str, ...)
  return substitute(a:str, '\v(^\s*|\s*$)', a:0 ? a:1 : '', 'g')
endfunction!

setglobal foldtext=MyFoldtext()
