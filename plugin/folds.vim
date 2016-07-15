function! MyFoldtext ()
    if &foldmethod !=# 'syntax'
      let s = foldtext()
      let s = substitute(s, '\v^[+-]*\s*', s:leader(), '')
      let s = substitute(s, '\v(\d* lines):\s*(.*)', '\=printf("%s " . &commentstring, submatch(2), " " . submatch(1))', '')
      let s .= ' folded'
    else
      let s = s:leader()
      let num = v:foldend - v:foldstart
      let lines = filter(range(v:foldstart, v:foldend), 'indent(v:val) == indent(v:foldstart)')
      let s .= join(map(lines, 's:trimline(v:val)'), '…')
      let s .= ' '
      let s .= printf(&commentstring, ' ' . num . ' lines folded')
    endif
    let s .= ' '
    return s
endfunction!

function! s:leader ()
    return substitute(repeat('┄', indent(v:foldstart)), '\v.$', ' ', '')
endfunction

function! s:trimline (line)
    return substitute(getline(a:line), '\v(^\s*|\s*$)', '', 'g')
endfunction!

setglobal foldtext=MyFoldtext()
