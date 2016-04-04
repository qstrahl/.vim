let java_highlight_java_lang_ids = 1
let java_minlines = 50
let java_highlight_all = 1
" let java_highlight_functions = "indent"
let java_highlight_functions = "style"

setlocal tabstop=2

autocmd User ProjectionistActivate call s:activate()

function! s:activate() abort
  for [root, value] in projectionist#query('classpath')
    let syntastic_java_javac_classpath = value
    break
  endfor
endfunction
