setlocal scrolloff=0
nmap <silent> <buffer> <C-N> @=search('\v^commit [0-9a-f]{40}$','nw')<CR>ggzt
nmap <silent> <buffer> <C-P> @=search('\v^commit [0-9a-f]{40}$','bnw')<CR>ggzt
