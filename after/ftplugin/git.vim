setlocal scrolloff=0
nmap <silent> <buffer> <C-N> :<C-U><C-R>=search('\v^commit [0-9a-f]{40}$','nw')<CR><CR>zt
nmap <silent> <buffer> <C-P> :<C-U><C-R>=search('\v^commit [0-9a-f]{40}$','bnw')<CR><CR>zt
