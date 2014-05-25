function! s:SID ()
  let l:scripts = ""
  redir => l:scripts
  scriptnames
  redir END
  return "\<SNR>" . matchstr(split(l:scripts, '\n')[-1], '^\s*\zs\d\+\ze') . "_"
endfunction

if !exists('s:sid')
  silent let s:sid = s:SID()
endif

function! s:MyGitCommit(buf)
  try
    let commit = fugitive#buffer(a:buf).containing_commit()
    return commit == ':' ? 'HEAD' : commit == 'HEAD' ? '' : strpart(commit, 0, 7)
  catch /^fugitive:/
    return ''
  endtry
endfunction

function! s:FilterGitArgs(arg)
  return a:arg !~# '\v^(--no-pager|--show-number|--contents|-)$'
endfunction

function! s:TransformGitArgs(arg)
  if a:arg =~# '\v^[[:xdigit:]]{40}$'
    return strpart(a:arg, 0, 7)
  else
    return a:arg
  endif
endfunction

function! s:MyBufferName(buf)
  let name = bufname(a:buf)

  if &ft == 'netrw' && exists('b:netrw_curdir')
    let name = b:netrw_curdir
  elseif &buftype == 'quickfix'
    let name = exists('w:quickfix_title') ? w:quickfix_title : '[Quickfix List]'
  elseif name == ''
    let name = '[No Name]'
  elseif len(getbufvar(a:buf, 'git_args'))
    let name = join(['!git'] + map(filter(getbufvar(a:buf, 'git_args'), s:sid . 'FilterGitArgs(v:val)'), s:sid . 'TransformGitArgs(v:val)'), ' ')
  else
    try
      if fugitive#buffer().type() ==# 'commit'
        let name = fugitive#buffer().repo().tree()
      else
        let name = fugitive#buffer().path()
      endif
    catch /^fugitive:/
      "" That's okay
    endtry
  endif

  return strlen(fnamemodify(name, ':~:.')) ? fnamemodify(name, ':~:.') : fnamemodify(name, ':~')
endfunction

function! s:MyQuickfixIndicator(buf)
  redir => buffers
  silent ls
  redir END

  let nr = bufnr(a:buf)
  for buf in split(buffers, '\n')
    if match(buf, '\v^\s*'.nr) > -1
      if match(buf, '\[Quickfix List\]') > -1
        return 'Q'
      else
        return 'L'
      endif
    endif
  endfor
  return ''
endfunction

function! s:MyGitIndicator (buf)
  try
    let c = get({
      \ 'blob': '',
      \ 'commit': 'C',
      \ 'directory': '',
      \ 'file': '',
      \ 'head': 'R',
      \ 'index': 'I',
      \ 'null': '',
      \ 'tree': ''
      \ }, fugitive#buffer(a:buf).type())

    return empty(c) ? '' : c
  catch /^fugitive:/
    return ''
  endtry
endfunction

function! s:MyStatusLine()
  let s = ''
  let s .= '%('
  let s .= '%{&previewwindow?"P":""}'
  let s .= '%{&buftype=="help"?"H":""}'
  let s .= '%{&buftype=="quickfix"?' . s:sid . 'MyQuickfixIndicator("%"):""}'
  let s .= '%{' . s:sid . 'MyGitIndicator("%")}'
  let s .= ' %)'
  let s .= '%<'
  let s .= '%{' . s:sid . 'MyBufferName("%")}'
  let s .= '%( ⌥ %{' . s:sid . 'MyGitCommit("%")}%)'
  let s .= '%( %{&modified?"+":""}%)'
  let s .= '%( %{!&modified && &modifiable?"✓":""}%)'
  " let s .= '%( %{!&modifiable||&readonly?"⚓":""}%)'
  let s .= '%='
  let s .= ' %l,%c%V'
  return s
endfunction

exe 'se stl=%!' . s:sid . 'MyStatusLine()'
