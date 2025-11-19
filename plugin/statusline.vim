let s:ruler = "%5.(%l:%)%-7.(%c%V%) %P"
let s:repo = "%(\ue65d %{StlRepo()} %)"
let s:commit = "\ueafc%{StlCommit()}"

function! MyStatusLine()
  let stl = ""
  let stl .= s:repo
  let stl .= "%1*%<%{StlName()}%*"
  let stl .= "%( " . s:commit . "%)%( %{StlMod()}%)"
  let stl .= "%= "
  let stl .= s:ruler
  return stl
endfunction

function! MyGitStatusLine()
  let stl = ""
  let stl .= s:repo
  let stl .= "%1*" . s:commit . "%* "
  let stl .= "%<%(\u00b7 %{StlGitFile()}%)"
  let stl .= "%= %P"
  return stl
endfunction

function! MyQfStatusLine()
  return "\ueb86 %1*%<%{get(w:,'quickfix_title','')}%*%= %{StlListItems()}"
endfunction

function! MyHelpStatusLine()
  return "\uf059 %1*%{expand('%:t:r')}%* %<%(\u00b7 %{StlHelpTags()}%)%= " . s:ruler
endfunction

function! s:prevmatch(pattern, ...)
  let limit = a:0 ? a:1 : 9999
  let start = line('.')
  let linenr = start
  while linenr > 0 && linenr >= start - limit
    let line = getline(linenr)
    let matches = matchlist(line, a:pattern)
    if len(matches)
      return matches
    endif
    let linenr -= 1
  endwhile
  return []
endfunction

function! StlHelpTags()
  let matches = s:prevmatch('\(\s\+\*\([^*]\|]\\\*\)\+\*\)\+')

  if len(matches)
    let [ section; _ ] = matches
    let section = trim(section)[1:-2]
    let section = split(section, '\*\s*\*')
    let section = join(section, " \u00b7 ")
    return section
  else
    return ''
  endif
endfunction

function! StlGitFile()
  let matches = s:prevmatch('^diff --git \(\f\+\) \(\f\+\)')

  if len(matches)
    let [ _, afile, bfile; _ ] = matches
    let file = bfile ==# '/dev/null' ? afile : bfile
    let file = split(file, '/')
    let file = join(file[1:], '/')
    return file
  else
    return ''
  endif
endfunction

function! StlRepo()
  if !exists('b:stl_repo')
    let b:stl_repo = fnamemodify(FugitiveWorkTree(), ':s?/\+??:t')
  endif
  return b:stl_repo
endfunction

function! StlName()
  "" Handle no-name and scratch buffers
  if @% ==# ''
    if &buftype ==# 'nofile' && &bufhidden ==# 'hide' && !&swapfile
      return '[Scratch]'
    else
      return '[No Name]'
    endif
  elseif &buftype ==# 'nofile'
    return @%
  endif

  "" Handle special fugitive buffers

  let fugitive_type = get(b:, 'fugitive_type', '')

  if fugitive_type ==# 'index'
    return 'Git Status'
  endif

  "" Strip plugin scheme from directory names
  let name = expand('%:p:s?^oil://??')

  let gitdir = FugitiveWorkTree()
  let [ commit, path ] = s:gitdata()

  if fugitive_type ==# 'blob'
    return path
  elseif fugitive_type ==# 'tree'
    "" Show path relative to git dir
    "" For the git dir itself, show path relative to $HOME
    let path = len(path) ? path : fnamemodify(gitdir, ':~')

    "" Always show a trailing slash
    if path !~# '/$'
      let path .= '/'
    endif

    return path
  endif

  "" Handle everything else

  "" if editing a file/directory in a git repo
  if len(gitdir) && gitdir !=# name[:-2]
    "" show name relative to git worktree
    return name[len(gitdir) + 1:]
  else
    "" for everything else, show name relative to $HOME
    return fnamemodify(name, ':~')
  endif
endfunction

function! StlCommit()
  let [ commit, _ ] = s:gitdata()

  return commit[:6]
endfunction

function! StlMod()
  if !&modifiable || &buftype =~# '\vhelp|quickfix|terminal|prompt'
    return ''
  elseif &modified
    return '+'
  else
    return ' '
  endif 
endfunction

function! StlListItems()
  let wintype = win_gettype()
  let what = {'size': 0, 'idx': 0}
  let list = wintype ==# 'quickfix' ? getqflist(what) : getloclist(0, what)
  return '[' . list.idx . '/' . list.size . ']'
endfunction

function! s:gitdata()
  let [ gitpath; _ ] = FugitiveParse()
  let gitdata = matchlist(gitpath, '\v^(:?\x+)?(:\f*)?$')
  let [ commit, path ] = len(gitdata) > 2 ? gitdata[1:2] : ['', '']

  return [ commit, path[1:] ]
endfunction

function! s:SetStatusLine()
  if &filetype ==# 'qf'
    setlocal statusline=%!MyQfStatusLine()
  elseif &filetype ==# 'help'
    setlocal statusline=%!MyHelpStatusLine()
  elseif &filetype ==# 'git' && get(b:, 'fugitive_type') ==# 'commit'
    setlocal statusline=%!MyGitStatusLine()
  else
    setlocal statusline<
  endif
endfunction

augroup MyStatusLine
  autocmd!
  autocmd FileType * call s:SetStatusLine()
augroup END

setglobal statusline=%!MyStatusLine()
