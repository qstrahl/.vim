let java_highlight_java_lang_ids = 1
let java_minlines = 50
let java_highlight_all = 1
" let java_highlight_functions = "indent"
let java_highlight_functions = "style"

setlocal tabstop=2

if !exists('*s:SetJavaClasspath')
  function! s:SetJavaClasspath (id, data, event)
    if a:event == 'stdout'
      let b:classpath .= join(a:data, '')
    elseif !a:data && strlen(b:classpath)
      let g:syntastic_java_javac_classpath = b:classpath
    endif
  endfunction
endif

if exists('*jobstart') && executable('activator')
  if !exists('b:classpath')
    let b:classpath = ''

    autocmd WinEnter <buffer> if strlen(b:classpath) | let g:syntastic_java_javac_classpath = b:classpath | endif

    call jobstart('activator "export test:full-classpath"', {
      \ 'on_stdout': function('s:SetJavaClasspath'),
      \ 'on_exit'  : function('s:SetJavaClasspath'),
      \ 'pty'      : 1
    \ })
  elseif strlen(b:classpath)
    let g:syntastic_java_javac_classpath = b:classpath
  endif
endif
