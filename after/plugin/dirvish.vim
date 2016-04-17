augroup DirvishOnStart
  autocmd!
  autocmd VimEnter * if !argc() && !&modified | Dirvish | endif
augroup END

nnoremap _ :<C-U>exe 'sp<Bar>Dirvish %:p'.repeat(':h',v:count1)<CR>
nnoremap \| :<C-U>exe 'vsp<Bar>Dirvish %:p'.repeat(':h',v:count1)<CR>
nnoremap + :<C-U>exe '-tabedit %<Bar>Dirvish %:p'.repeat(':h',v:count1)<CR>
