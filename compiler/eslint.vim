if exists('current_compiler')
  finish
endif
let current_compiler = 'eslint'
CompilerSet efm=\ \ %l:%c\ \ %t%*\\w\ \ %m
CompilerSet efm+=%-P%f
CompilerSet efm+=%-G%m
CompilerSet efm+=%-G%p
