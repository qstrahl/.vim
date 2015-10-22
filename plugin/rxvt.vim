if $COLORTERM !~? 'rxvt' || !executable('echo') || !filewritable('/dev/tty')
  finish
endif

augroup MyRxvt
  autocmd!

  "" Set cursor to blinking bar while in insert mode
  autocmd InsertEnter * silent !echo -ne '\e[5 q' > /dev/tty
  autocmd InsertLeave,VimLeave * silent !echo -ne '\e[0 q' > /dev/tty
augroup END
