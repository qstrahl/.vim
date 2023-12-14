let s:ruler = "%= %5.(%l:%)%-7.(%c%V%) %P"
let s:repo = "%(\ue65d %{StlRepo()} %)"
let s:commit = "\ueafc%{StlCommit()}"

function! MyStatusLine()
  let stl = ""
  let stl .= s:repo
  let stl .= "%1*%<%{StlName()}%*"
  let stl .= "%( " . s:commit . "%)%( %{StlMod()}%)"
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
  return "\ueb86 %1*%<%{get(w:,'quickfix_title','')}%*%= %1*%l%*/%L"
endfunction

function! MyHelpStatusLine()
  return "\uf059 %1*%{expand('%:t:r')}%* %<%(\u00b7 %{StlHelpTags()}%)" . s:ruler
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
  if !exists('b:stl_name')
    let b:stl_name = ''

    let name = expand('%:p')

    if name =~# '^oil://'
      let name = name[6:]
    endif

    let gitdir = FugitiveWorkTree()
    let [ gitpath; _ ] = FugitiveParse()

    "" if editing a git blob
    if len(gitpath)
      let [ _, commit, path; _ ] = matchlist(gitpath, '\v^(:?\x+)?(:\f*)?$')
      let path = path[1:]

      let commit = StlCommit()

      "" add commit info and gitdir-relative name to window vars
      if path ==# ''
        if commit ==# ''
          "" if path and commit are both empty, this is the git status buffer
          let b:stl_name = 'Git Status'
        else
          "" if only path is empty, this is a commit buffer; use commit as name
          let b:stl_name = 'Git Commit: ' . commit
        endif
      else
        "" if path is not empty, we're editing a blob
        let b:stl_name = path
      endif
    "" if editing a nameless buffer
    elseif @% ==# ''
      if &buftype ==# 'nofile' && &bufhidden ==# 'hide' && !&swapfile
        let b:stl_name = '[Scratch]'
      else
        let b:stl_name = '[No Name]'
      endif
    "" if editing a file within a git repo
    elseif len(gitdir) > 0 && gitdir !=# name[:-2]
      "" show name relative to git worktree
      let b:stl_name = name[len(gitdir) + 1:]
    else
      "" show name relative to $HOME
      let b:stl_name = fnamemodify(name, ':~')
    endif
  endif

  return b:stl_name
endfunction

function! StlCommit()
  if !exists('b:stl_commit')
    let b:stl_commit = ''

    let [ gitpath; _ ] = FugitiveParse()
    if len(gitpath)
      let [ _, commit, path; _ ] = matchlist(gitpath, '\v^(:?\x+)?(:\f*)?$')
      
      let b:stl_commit = commit[0:7]
    endif
  endif

  return b:stl_commit
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

augroup MyStatusLine
  autocmd!
  autocmd FileType * setlocal statusline<
  autocmd FileType qf setlocal statusline=%!MyQfStatusLine()
  autocmd FileType git setlocal statusline=%!MyGitStatusLine()
  autocmd FileType help setlocal statusline=%!MyHelpStatusLine()
augroup END

setglobal statusline=%!MyStatusLine()
