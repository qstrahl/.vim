if $COLORTERM !~# '^xterm'
  finish
endif

"" render italics as underlined
exe "set t_ZH=\<Esc>[4m"
exe "set t_ZR=\<Esc>[24m"

"" ctrl + cursor keys
exe "set <xUp>=\<Esc>[1;5A"
exe "set <xDown>=\<Esc>[1;5B"
exe "set <C-Right>=\<Esc>[1;5C"
exe "set <C-Left>=\<Esc>[1;5D"

"" shift + cursor keys
exe "set <S-Up>=\<Esc>[1;2A"
exe "set <S-Down>=\<Esc>[1;2B"
exe "set <S-Right>=\<Esc>[1;2C"
exe "set <S-Left>=\<Esc>[1;2D"

"" cursor change on insert mode enter/leave
let &t_SI = "\<Esc>[5 q"
let &t_EI = "\<Esc>[2 q"
