"" <C-N> to create a new file in that directory
nunmap <buffer> <C-N>
nmap <buffer> <C-N> <Cmd>exe 'e %/' . input(':e ' . expand('%/'))<CR>

" setlocal bufhidden=unload
silent! call FugitiveDetect(@%)

"" Sort with directories first, then with dotfiles first, then case-insensitively
silent! sort ir :\v[^/]+$:

"" Force an undo point
let &g:undolevels = &g:undolevels

" augroup dirvish_buflocal_custom
"   autocmd!
"   autocmd! BufEnter <buffer> lcd %
" augroup END
