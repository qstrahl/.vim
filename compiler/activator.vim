if exists('current_compiler')
  finish
endif
let current_compiler = 'activator'
CompilerSet makeprg=activator
CompilerSet efm=%C[error]\ %m,%E[error]\ %m,%-Z%.%#,%-G%m
