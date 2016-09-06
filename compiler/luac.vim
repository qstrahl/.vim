if exists('current_compiler')
  finish
endif
let current_compiler = 'luac'
CompilerSet makeprg=luac\ -p
CompilerSet efm=luac:\ %f:%l:\ %m
