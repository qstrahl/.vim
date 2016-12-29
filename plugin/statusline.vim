finish

function! statusline#MyGitCommit(buf)
  if &buftype ==# 'quickfix\|help'
    return ''
  endif
  let commit = ''
  try
    let commit = fugitive#buffer(a:buf).containing_commit()
    let commit = commit ==# ':' ? 'HEAD' : commit ==# 'HEAD' ? fugitive#head(7) : strpart(commit, 0, 7)
  catch /^fugitive:/
    return ''
  endtry
  return !empty(commit) ? '⑂ ' . commit : ''
endfunction

function! statusline#FilterGitArgs(arg)
  return a:arg !~# '\v^(--no-pager|--show-number|--contents|-n|--no-color|--git-dir=\f+|-)$'
endfunction

function! statusline#TransformGitArgs(arg)
  if a:arg =~# '\v^[[:xdigit:]]{40}$'
    return strpart(a:arg, 0, 7)
  else
    return a:arg
  endif
endfunction

function! statusline#customrev(part)
  try
    let buf = fugitive#buffer()
    let type = buf.type()
    let rev = buf.rev()
    let path = buf.path()
    let repo = buf.repo()
    let dir = fnamemodify(repo.tree(), ':~')

    if type == 'file'
      let matches = [rev, '', path]
    elseif type == 'directory'
      let matches = [rev, '', empty(path) ? dir . '/' : path . '/']
    elseif type  == 'index'
      let matches = [rev, '', path]
    else
      let matches = matchlist(rev, '\v^%(:?([0-9a-f]*))%(:(\f*))?$')
      if matches[1] == '0'
        let matches[1] = 'HEAD'
      endif
      let matches[2] = empty(matches[2]) ? dir : matches[2]
    endif

    return get(matches, a:part, '')
  catch /./
    return ''
  endtry
endfunction

function! statusline#MyBufferName()
  let name = bufname('%')

  if &buftype ==# 'help'
    return expand('%:t')
  elseif &buftype ==# 'quickfix'
    let name = substitute(w:quickfix_title, '\s*--git-dir=\f\+\s*--no-pager', '', '')
    let name = substitute(name, '\s*--no-color', '', '')
    return name
  endif

  if &buftype == 'quickfix'
    let name = exists('w:quickfix_title') ? w:quickfix_title : '[Quickfix List]'
  elseif name == ''
    let name = '[No Name]'
  endif

  return strlen(fnamemodify(name, ':~:.')) ? fnamemodify(name, ':~:.') : fnamemodify(name, ':~')
endfunction

function! statusline#qfindicator()
  redir => buffers
  silent ls!
  redir END

  let nr = bufnr('%')
  for buf in split(buffers, '\n')
    if match(buf, '\v^\s*'.nr) > -1
      if match(buf, '\[Quickfix List\]') > -1
        return 'qflist'
      else
        return 'loclist'
      endif
    endif
  endfor
  return ''
endfunction

function! statusline#gitindicator()
  try
    let c = get({
      \ 'blob': '',
      \ 'commit': 'commit',
      \ 'directory': '',
      \ 'file': '',
      \ 'head': 'head',
      \ 'index': 'index',
      \ 'null': '',
      \ 'tree': ''
      \ }, fugitive#buffer('%').type())

    return empty(c) ? '' : c
  catch /^fugitive:/
    return ''
  endtry
endfunction

let s:indicators = ''
let s:indicators .= '%('
let s:indicators .= '%{&previewwindow?"[preview]":""}'
let s:indicators .= '%{&buftype=="help"?"[help]":""}'
let s:indicators .= '%([%{&buftype=="quickfix"?statusline#qfindicator():""}]%)'
let s:indicators .= '%([%{statusline#gitindicator()}]%)'
let s:indicators .= ' %)'
let s:indicators .= '%<'

let s:icons = ''
let s:icons .= '%(%{&modified?"+":""}%)'
let s:icons .= '%(%{&buftype=~#"quickfix\\|help"?"":!&modifiable||&readonly?"⚓":""}%)'

let s:name = '%(%{statusline#MyBufferName()}%)'

let s:gitname = '%{statusline#customrev(2)} '
let s:gitrev = '%(⑂ %{statusline#customrev(1)[0:6]} %)'

let s:ruler = '%= %l,%c%V'

function! statusline#default(...)
  let parts = [ s:indicators ] + (a:0 ? a:000 : [ s:name, ' ' ]) + [ s:icons, s:ruler ]
  return join(parts, '')
endfunction

function! statusline#git()
  return statusline#default(s:gitname, s:gitrev)
endfunction

" hi User1 ctermbg=0 ctermfg=4
" hi User2 ctermbg=0 ctermfg=2

setglobal statusline=%!statusline#default()

augroup CustomStatusLine
  autocmd!
  autocmd User Fugitive setlocal statusline=%!statusline#git()
augroup END
