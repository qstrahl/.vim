if exists('current_compiler')
  finish
endif
let current_compiler = 'stylelint'
CompilerSet efm=\ %l:%c\ \ %.\ \ %m
CompilerSet efm+=%-P%f
CompilerSet efm+=%-Q
CompilerSet efm+=%-G%m
CompilerSet efm+=%-G%p
