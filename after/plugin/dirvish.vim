augroup DirvishOnStart
  autocmd!
  autocmd VimEnter * if !argc() && !&modified | Dirvish | endif
augroup END

nmap - <Plug>(dirvish_up)
nmap _ <C-W>s<Plug>(dirvish_up)
nmap \| <C-W>v<Plug>(dirvish_up)
nmap + :<C-U>-tabedit %<CR><Plug>(dirvish_up)
