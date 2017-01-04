set fdm=syntax
set comments-=://

let b:syntastic_mode = 'active'
let b:syntastic_javascript_jshint_exec = findfile('jshint', 'node_modules/*jshint*/**/bin')
let b:syntastic_javascript_jslint_exec = findfile('jslint', 'node_modules/*jslint*/**/bin')

let b:syntastic_checkers = []
if !empty(b:syntastic_javascript_jshint_exec)
    let b:syntastic_javascript_jshint_exec = fnamemodify(b:syntastic_javascript_jshint_exec, ':p:~')
    let b:syntastic_checkers += ['jshint']
endif
if !empty(b:syntastic_javascript_jslint_exec)
    let b:syntastic_javascript_jslint_exec = fnamemodify(b:syntastic_javascript_jslint_exec, ':p:~')
    let b:syntastic_checkers += ['jslint']
endif
if empty(b:syntastic_checkers)
    unlet b:syntastic_checkers
endif

augroup MyJavascript
    autocmd!
    autocmd Syntax <buffer> syn clear jsFutureKeys
augroup END

let b:deoplete_sources = [ 'ternjs', 'buffer' ]
let b:deoplete_member_prefix_patterns = '\.'
" let b:deoplete_omni_patterns = '[^. *\t]\.\w*'
