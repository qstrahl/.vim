augroup MyOil
  autocmd!
  autocmd FileType oil call FugitiveDetect(expand('%:s?oil://??'))
augroup END

nnoremap - <Cmd>Oil<CR>
