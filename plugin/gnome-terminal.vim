if $COLORTERM !~# 'gnome-terminal'
  finish
endif

exe "set t_ZH=\<Esc>[3m"
exe "set t_ZR=\<Esc>[23m"

silent! let s:default_cursor = system('gconftool-2 --get /apps/gnome-terminal/profiles/Default/cursor_shape')

augroup GnomeTerminalCursor
  au!
  au InsertEnter * silent! execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave,VimLeave * silent! execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape" s:default_cursor
augroup END
