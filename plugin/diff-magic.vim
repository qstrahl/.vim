augroup MyDiffMagic
  au!
  au InsertLeave,TextChanged * if &diff | diffupdate | endif
augroup END
