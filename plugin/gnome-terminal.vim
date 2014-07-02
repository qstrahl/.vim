if $COLORTERM !~# 'gnome-terminal'
  finish
endif

exe "set t_ZH=\<Esc>[3m"
exe "set t_ZR=\<Esc>[23m"
