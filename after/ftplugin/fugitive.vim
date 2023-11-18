let [ gitpath, gitdir ] = FugitiveParse()

"" special settings for git status buffer
if gitpath ==# ':'
  setlocal cursorline
  setlocal scrolloff=999

  "" map j/k and <C-J>/<C-K> to move between files
  " nmap <buffer> j )
  " nmap <buffer> k (
  nmap <buffer> <C-J> )
  nmap <buffer> <C-K> (

  "" Esc in normal mode quits the status window
  nmap <buffer> <Esc> <C-W>q

  "" maps to open highlighted file
  nmap <buffer> <C-V> gO
  nmap <buffer> <C-Bslash> gO
  nmap <buffer> <Bar> gO
  nmap <buffer> <C-S> o
  nmap <buffer> <C--> o
  nmap <buffer> _ o

  " function s:BufWinEnter ()
  "   if &previewwindow
  "     exe line('$') 'wincmd _'
  "   endif
  " endfunction
  "
  " augroup FugitiveBufferCustom
  "   autocmd!
  "   autocmd BufWinEnter <buffer> call s:BufWinEnter()
  "   " autocmd WinLeave <buffer> wincmd z
  " augroup END

  let b:undo_ftplugin = 'set cursorline< scrolloff<'
  " let b:undo_ftplugin .= '|nunmap <buffer> j'
  " let b:undo_ftplugin .= '|nunmap <buffer> k'
  let b:undo_ftplugin .= '|nunmap <buffer> <C-J>'
  let b:undo_ftplugin .= '|nunmap <buffer> <C-K>'
endif
