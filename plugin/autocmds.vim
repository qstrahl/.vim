"" Choose an appropriate working directory for the current window
function! s:cd()
  let bufname = expand('%:p:s?^oil://??')
  let gitdir = FugitiveWorkTree()
  let [ gitpath; _ ] = FugitiveParse()
  let dir = isdirectory(bufname) ? bufname : gitdir

  if len(dir)
    exe 'lcd' dir
    " let scope = 'window'
  else
    exe 'cd' getcwd(-1)
    " let scope = 'global'
  endif

  " exe 'doautocmd DirChanged' scope
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

function! s:SetupQF()
  call s:ResizeQF()

  augroup MyCustomQF
    autocmd!
    autocmd TextChanged <buffer> call s:ResizeQF()
  augroup END
endfunction

function! s:ResizeQF()
  let maxheight = get(g:, 'qf_max_height', &previewheight)
  let listlen = line('$')
  exe min([ maxheight, listlen ]) 'wincmd _'
endfunction

augroup MyCustomAutocmds
  autocmd!
  " autocmd VimEnter * if !len(expand('%') . &buftype) | setlocal bufhidden=wipe | endif
  autocmd VimResized * if &equalalways | wincmd = | endif
  autocmd TextChanged,InsertLeave * if &diff | diffupdate | redraw! | endif
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
  autocmd BufWinEnter,WinNew * call s:cd()

  "" translate Windows paths to WSL paths
  autocmd FileReadCmd \v^\a:\\[[:fname:]\\]+$ call s:ReadWindowsFile(expand('<afile>'))
  autocmd BufReadCmd  \v^\a:\\[[:fname:]\\]+$ call s:EditWindowsFile(expand('<afile>'))

  "" If a swapfile already exists, just open the corresponding file readonly
  " autocmd SwapExists * let v:swapchoice = "o"

  "" TODO: revisit a pull request on romainl/vim-qf to integrate with fugitive
  autocmd QuickFixCmdPost grep-fugitive nested call qf#OpenQuickfix()
  autocmd QuickFixCmdPost lgrep-fugitive nested call qf#OpenLoclist()

  autocmd BufWinEnter * if &buftype ==# 'quickfix' | call s:SetupQF() | endif
augroup END
