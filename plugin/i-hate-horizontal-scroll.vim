augroup IHateHorizontalScroll
  autocmd!
  autocmd WinEnter,WinLeave * normal! ze
augroup END

nnoremap <silent> <C-w>H <C-w>H:<C-u>windo normal! ze<CR><C-w>t
nnoremap <silent> <C-w>J <C-w>J:<C-u>windo normal! ze<CR>
nnoremap <silent> <C-w>K <C-w>K:<C-u>windo normal! ze<CR><C-w>t
nnoremap <silent> <C-w>L <C-w>L:<C-u>windo normal! ze<CR>

vnoremap <silent> <C-w>H <C-w>H:<C-u>windo normal! ze<CR><C-w>tgv
vnoremap <silent> <C-w>J <C-w>J:<C-u>windo normal! ze<CR>gv
vnoremap <silent> <C-w>K <C-w>K:<C-u>windo normal! ze<CR><C-w>tgv
vnoremap <silent> <C-w>L <C-w>L:<C-u>windo normal! ze<CR>gv
