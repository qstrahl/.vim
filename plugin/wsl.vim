finish
if !has('clipboard') && executable('clip.exe') && executable('paste.exe')
  let g:clipboard = {
        \   'name': 'WSL',
        \   'copy': {
        \      '+': {lines -> system('clip.exe', lines)},
        \      '*': {lines -> system('clip.exe', lines)}
        \    },
        \   'paste': {
        \      '+': {-> system('paste.exe')},
        \      '*': {-> system('paste.exe')}
        \   },
        \   'cache_enabled': 0
        \ }
endif
