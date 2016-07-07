setlocal wrap linebreak breakindent
noremap <buffer> j gj
noremap <buffer> k gk
noremap <buffer><expr> $ empty(&virtualedit) ? 'g$' : 'g$ge'
noremap <buffer> 0 g0
noremap <buffer> ^ g^
noremap <buffer><expr> G v:count ? v:count.'G' : 'G$g0'
