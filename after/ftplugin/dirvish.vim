"" Change the current directory of the window to this directory
lcd %

setlocal bufhidden=unload
silent! call FugitiveDetect(@%)

"" Sort with directories first, then with dotfiles first, then case-insensitively
silent! sort ir :\v[^/]+$:

"" Force an undo point
let &g:undolevels = &g:undolevels

augroup dirvish_buflocal_custom
  autocmd!
  autocmd! BufEnter <buffer> lcd %
augroup END
