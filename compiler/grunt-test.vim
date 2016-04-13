if exists('current_compiler')
  finish
endif
let current_compiler = 'grunt test'
CompilerSet makeprg=grunt\ test
CompilerSet efm=%+A%*\\sExpected\ %m,%+A%*\\s%.%#Error:\ %m,%Z%*\\sat\ %f:%l:%c,%Z%*\\sat\ %f:%l,%-G%m,%-G%p
