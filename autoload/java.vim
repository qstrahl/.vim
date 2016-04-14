if !exists('g:java#PendingClasspath')
  let g:java#PendingClasspath = {}
endif

if !exists('g:java#Classpaths')
  let g:java#Classpaths = {}
endif

function! java#DetermineClasspath (id, data, event)
  if a:event == 'stdout'
    let self.classpath .= join(a:data, '')
  elseif a:event == 'exit' && !a:data
    let self.classpath = get(split(self.classpath, "\r"), -1)
    if java#IsClasspath(self.classpath)
      let set_global_classpath = 0
      for buf in g:java#PendingClasspath[self.root]
        let buf.classpath = self.classpath
        if !set_global_classpath && buf is getbufvar('%', '')
          let set_global_classpath = 1
        endif
      endfor
      let g:java#Classpaths[self.root] = self.classpath
      if set_global_classpath
        call java#SetClasspath(self.classpath)
      endif
    endif

    unlet g:java#PendingClasspath[self.root]
  endif
endfunction

function! java#IsClasspath (classpath)
  return type(a:classpath) == type('') && a:classpath =~# '\v^(\f+:)*\f+$'
endfunction

function! java#SetClasspath (classpath)
  if java#IsClasspath(a:classpath)
    let g:syntastic_java_javac_classpath = a:classpath
  endif
endfunction

function! java#ProjectionistActivate ()
  let root = projectionist#path()
  let pending = get(g:java#PendingClasspath, root, [])

  if strlen(get(g:java#Classpaths, root, ''))
    let b:classpath = g:java#Classpaths[root]
  endif

  if exists('b:classpath')
    call java#SetClasspath(b:classpath)

  elseif !count(pending, b:)
    let g:java#PendingClasspath[root] = add(pending, b:)

    if len(pending) == 1 && exists('*jobstart') && executable('activator')
      call jobstart('activator "export test:full-classpath"', {
        \ 'on_stdout': function('java#DetermineClasspath'),
        \ 'on_exit'  : function('java#DetermineClasspath'),
        \ 'pty'      : 1,
        \ 'root'     : root,
        \ 'classpath': ''
      \ })
    endif
  endif

  augroup SetClasspath
    autocmd! WinEnter <buffer>
    autocmd WinEnter <buffer> call java#SetClasspath(get(b:, 'classpath'))
  augroup END
endfunction
