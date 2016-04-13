if exists('current_compiler')
  finish
endif
let current_compiler = 'activator test'
CompilerSet makeprg=activator\ test
CompilerSet efm=%C[error]\ %m,%E[error]\ %m,%-G%m,%-G%p
