silent! call fugitive#detect(@%)
silent! call ProjectionistDetect(resolve(expand('%:p'))) 

"" Sort with directories first, then with dotfiles first, then case-insensitively
silent! sort ir :\v[^/]+$:

"" Force an undo point
let &undolevels = &undolevels

"" Delete dotfile entries ("hidden" files)
silent! keeppatterns g:\v/\.[^/]+/?$:d

"" Change the current directory of the window to this directory
lcd %
