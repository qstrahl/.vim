"" Manage window-specific stuff like working directory, statusline, etc
function! s:ManageWindow()
  let bufname = expand('%:p')
  let gitdir = FugitiveWorkTree()
  let [ gitpath; _ ] = FugitiveParse()
  let dir = isdirectory(bufname) ? bufname : gitdir

  " echoerr 'ManageWindow' bufname dir gitdir gitpath

  "" choose an appropriate working directory for the current buffer
  if len(dir)
    exe 'lcd' dir
    let scope = 'window'
  else
    exe 'cd' getcwd(-1)
    let scope = 'global'
  endif

  " exe 'doautocmd DirChanged' scope

  let b:repo = fnamemodify(gitdir, ':t')
  let b:bufname = ''
  let b:commit = ''

  "" if editing a git blob
  if len(gitpath)
    let [ _, commit, path; _ ] = matchlist(gitpath, '\v^(:?\x+)?(:\f*)?$')
    let path = path[1:]
    
    "" handle special cases (staged file, merge sources, etc)
    if commit ==# ':0'
      let commit = 'staged'
    else
      let commit = commit[0:7]
    endif

    "" add commit info and gitdir-relative bufname to window vars
    if path ==# ''
      if commit ==# ''
        "" if path and commit are both empty, this is the git status buffer
        let b:bufname = 'Git Status'
      else
        "" if only path is empty, this is a commit buffer; use commit as name
        let b:bufname = 'Git Commit: ' . commit
      endif
    else
      "" if path is not empty, we're editing a blob
      let b:bufname = path
      let b:commit = commit
    endif
  elseif bufname ==# gitdir . '/'
    let b:bufname = fnamemodify(bufname, ':~')
  elseif len(gitdir)
    "" show bufname relative to git worktree
    let b:bufname = bufname[len(gitdir) + 1:]
  else
    "" show bufname relative to $HOME
    " let b:bufname = fnamemodify(bufname, ':~')
  endif

  "" use custom statusline for special git buffers / files in git repos
  if len(b:bufname . b:commit)
    setlocal statusline=%<%([%{b:repo}]%)\ %{b:bufname}\ %([%{b:commit}]%)%h%m%r%=%-14.(%l,%c%V%)\ %P
  else
    set statusline<
  endif
endfunction

function! s:WindowsFilePath(fname)
  let [ _, drive, path; _ ] = matchlist(a:fname, '\v^(\a):\\([[:fname:]\\]+)$')
  let [ drive, path ] = [ tolower(drive), substitute(path, '\', '/', 'g') ]

  return printf('/mnt/%s/%s', drive, fnameescape(path))
endfunction

"" Read from a windows file path into the current buffer
function! s:ReadWindowsFile(fname)
  let path = s:WindowsFilePath(a:fname)

  doautocmd FileReadPre
  exe 'read' path
  " silent lockmarks keepjumps -1delete_
  doautocmd FileReadPost
endfunction

"" Open a windows file path in a new buffer
function! s:EditWindowsFile(fname)
  let path = s:WindowsFilePath(a:fname)

  doautocmd BufReadPre
  exe 'keepalt keepjumps lockmarks edit' path
  doautocmd BufReadPost
  " silent lockmarks keepjumps delete_
endfunction

augroup MyCustomAutocmds
  autocmd!
  " autocmd VimEnter * if !len(expand('%') . &buftype) | setlocal bufhidden=wipe | endif
  autocmd VimResized * if &equalalways | wincmd = | endif
  autocmd TextChanged,InsertLeave * if &diff | diffupdate | endif
  " TODO: figure out wtf I'm doing with my life
  " autocmd OptionSet diff if &diff | exe 'normal zz' | endif
  " autocmd CursorMoved,TextChanged * if &diff | exe 'normal zz' | endif
  " autocmd Syntax * syntax sync fromstart

  "" what the fuck does this do?
  " autocmd QuitPre * autocmd plugin/autocmds WinLeave * wincmd p | exe 'doautocmd WinEnter' winnr() | autocmd! plugin/autocmds WinLeave

  "" attempt to keep tmux CWD in sync with vim CWD
  autocmd DirChanged * call chansend(v:stderr, printf("\033]7;%s\033\\", fnameescape(getcwd())))
  autocmd VimLeave * call chansend(v:stderr, "\033]7;\033\\")

  "" uhhhhhh does this do stuff???
  autocmd BufReadPre,BufWritePre * let &l:undofile = expand('<afile>:p') !~# '\v\f*/?\.git/\u+(_\u+)*'

  "" automatically manage window stuff (working directory, statusline)
  autocmd BufWinEnter,WinNew * call s:ManageWindow()
  autocmd FileType dirvish call s:ManageWindow()

  "" translate Windows paths to WSL paths
  autocmd FileReadCmd \v^\a:\\[[:fname:]\\]+$ call s:ReadWindowsFile(expand('<afile>'))
  autocmd BufReadCmd  \v^\a:\\[[:fname:]\\]+$ call s:EditWindowsFile(expand('<afile>'))

  "" If a swapfile already exists, just open the corresponding file readonly
  " autocmd SwapExists * let v:swapchoice = "o"

  "" TODO: revisit a pull request on romainl/vim-qf to integrate with fugitive
  autocmd QuickFixCmdPost grep-fugitive nested call qf#OpenQuickfix()
  autocmd QuickFixCmdPost lgrep-fugitive nested call qf#OpenLoclist()
augroup END
