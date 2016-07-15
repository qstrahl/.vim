function! MyFoldtext ()
    if &foldmethod !=# 'syntax'
        return foldtext()
    endif

    let s = substitute(repeat('┄', indent(v:foldstart)), '\v.$', ' ', '')
    let num = v:foldend - v:foldstart
    let lines = filter(range(v:foldstart, v:foldend), 'indent(v:val) == indent(v:foldstart)')
    let s .= join(map(lines, 's:trimline(v:val)'), '…')
    let s .= ' '
    let s .= printf(&commentstring, ' ' . num . ' lines folded')
    let s .= ' '
    return s
endfunction!

function! s:trimline (line)
    return substitute(getline(a:line), '\v(^\s*|\s*$)', '', 'g')
endfunction!

setglobal foldtext=MyFoldtext()

function! s:toggleoff (win)
  if getwinvar(a:win, '&foldenable')
    call setwinvar(a:win, '&foldenable', 0)
    call setwinvar(a:win, 'set_foldenable', 1)
  endif
  redraw
  return ''
endfunction

function! s:toggleon (win)
  if getwinvar(a:win, 'set_foldenable', 0)
    call setwinvar(a:win, '&foldenable', 1)
    call setwinvar(a:win, 'set_foldenable', 0)
  endif
  redraw
  return ''
endfunction

augroup MyFolds
  autocmd!
  autocmd InsertEnter * call s:toggleoff(winnr())
  autocmd InsertLeave * call s:toggleon(winnr())
augroup END

nnoremap <expr> / <SID>toggleoff(winnr()) . '/'
nnoremap <expr> ? <SID>toggleoff(winnr()) . '?'
cnoremap <expr> <ESC> <SID>toggleon(winnr()) . '<C-c>'
cnoremap <expr> <C-c> <SID>toggleon(winnr()) . '<C-c>'
cnoremap <expr> <CR> <SID>toggleon(winnr()) . '<CR>'
