function! gotobuffer#prompt ()
  let bufstring = ''
  redir => bufstring
    ls
  redir END
  let buflist = map(split(bufstring, "\n"), 'gotobuffer#parse(v:val)')
  let listlen = len(buflist)
  let idx = 0
  let prompt = ''
  for item in buflist
    let idx += 1
    let prompt .= repeat(' ', strlen(listlen) - strlen(idx))
    let prompt .= idx
    let prompt .= ' '
    let prompt .= item.name
    let prompt .= "\n"
  endfor
  let prompt .= "\n"
  let prompt .= 'Goto Buffer: '
  let idx = eval(printf('%d', input(prompt))) - 1
  if idx >= 0 && idx <= listlen
    return ":\<C-U>" . buflist[idx].nr . "b\<CR>"
  endif
endfunction

function! gotobuffer#parse (line)
  let pattern = '\v\s*(\d+)[^"]*"(.*)"'
  let line = matchstr(a:line, pattern)
  let nr = substitute(line, pattern, '\1', '')
  let name = substitute(line, pattern, '\2', '')
  let name = fnamemodify(name, ':~')
  let relativename = fnamemodify(name, ':.')
  if strlen(relativename)
    let name = relativename
  endif
  return { "nr": nr, "name": name }
endfunction

nnoremap <silent> <expr> <Plug>(gotobuffer) gotobuffer#prompt()
nmap gb <Plug>(gotobuffer)
