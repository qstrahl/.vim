let s:nonempty = {k,v -> len(v)}
let s:items = {items -> join(filter(items, s:nonempty))}

let s:tab = {cur -> {i, tab -> ''
      \ . printf('%%#TabLine%s', tab.tabnr is cur.tabnr ? 'Sel#' : '#')
      \ . printf('%%%dT', tab.tabnr)
      \ . printf('%%(%%{tabline#mod(%d)} %%)', tab.tabnr)
      \ . printf('%d:', tab.tabnr)
      \ . printf('%%{tabline#label(%d)}', tab.tabnr)}}

" printf('[%d/%d] ', tabpagewinnr(tab.tabnr), len(tab.windows))

let s:trim = {path -> substitute(path, '\v^.+\zs/$', '', '')}

function! tabline#render ()
  let tabs = gettabinfo()
  let tabs = map(tabs, s:tab(tabs[tabpagenr()-1]))
  " if tabpagenr() > 1 && tabpagenr('$') > 1
  "   let tabs = tabs[tabpagenr()-1:] + tabs[:tabpagenr()-2]
  " endif
  let tabline = join(tabs, '  ')
  let tabline .= '%#TabLineFill#%T%='
  let tabline .= '%(%{tabline#bufname()}%)'
  return tabline
endfunction

function! tabline#bufname ()
  if exists('*FugitiveParse')
    let name = FugitiveParse()[0]
    if len(name)
      return name
    endif
  endif
  " if exists('*FugitiveReal')
  "   let name = exists('*FugitiveReal')FugitiveReal()
  " else
  let name = s:trim(bufname())
  if empty(name)
    return &buftype is 'nofile' ? '[Scratch]' : '[No Name]'
  elseif name is getcwd(-1)
    return fnamemodify(name, ':~')
  elseif name is getcwd() && exists('*FugitiveWorkTree')
    let tree = FugitiveWorkTree()
    return fnamemodify(name, ':s?^\V'.tree.'/??')
  elseif exists('*FugitiveWorkTree')
    return fnamemodify(name, ':~:.')
  endif
endfunction

function! tabline#mod (tabnr)
  for win in range(1, tabpagewinnr(a:tabnr, '$'))
    if gettabwinvar(a:tabnr, win, '&modified')
      return 'פֿ'
    endif
  endfor
  return ''
endfunction

function! tabline#label (tabnr)
  let active = a:tabnr is tabpagenr()

  let pwd = getcwd(-1, a:tabnr)
  let pwd = s:trim(fnamemodify(pwd, ':~'))
  let label = fnamemodify(pwd, ':t')

  let head = ''
  if exists('*FugitiveExtractGitDir')
    let gitdir = FugitiveExtractGitDir(pwd)
    let head = len(gitdir) ? fugitive#repo(gitdir).head(7) : ''
    let head = get(split(head, '/'), 0, head)
    let head = len(head) ? ' ' . head : ''
  endif

  return s:items([label, head])
endfunction
