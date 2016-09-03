if exists('current_compiler')
  finish
endif
let current_compiler = 'eslint'
CompilerSet efm=
CompilerSet efm+=%C\ \ %l:%c\ \ %.%#%tarning%.%#\ \ %m
CompilerSet efm+=%Z\ \ %l:%c\ \ %.%#%tarning%.%#\ \ %m
CompilerSet efm+=%C\ \ %l:%c\ \ %.%#%trror%.%#\ \ %m
CompilerSet efm+=%Z\ \ %l:%c\ \ %.%#%trror%.%#\ \ %m
CompilerSet efm+=%-G%*[^/]%m
CompilerSet efm+=%-G%p
CompilerSet efm+=%E%f
CompilerSet efm+=%W%f
