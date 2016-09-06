if exists('current_compiler')
  finish
endif
let current_compiler = 'eslint'
CompilerSet efm=\ \ %l:%c\ \ %trror\ \ %m
CompilerSet efm+=\ \ %l:%c\ \ %tarning\ \ %m
CompilerSet efm+=%-P%f
CompilerSet efm+=%-Q
CompilerSet efm+=%-G%m
CompilerSet efm+=%-G%p
