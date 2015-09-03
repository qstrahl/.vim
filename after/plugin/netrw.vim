let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_banner = 0
let g:netrw_alto=1
let g:netrw_altv=1
let g:netrw_use_errorwindow = 0
let g:netrw_bufsettings = 'noma nomod nonu nobl nowrap ro bh=unload nocuc nocul'
let g:netrw_keepdir = 1
let g:netrw_browsex_viewer = 'xdg-open'
let g:netrw_winsize = 0

nnoremap <Leader>e      :<C-U>Explore<CR>
nnoremap <Leader>se     :<C-U>sp +Explore<CR>
nnoremap <Leader>ve     :<C-U>vsp +Explore!<CR>
nnoremap <Leader>te     :<C-U>Texplore<CR>
