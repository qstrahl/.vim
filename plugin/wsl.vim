finish
if exists('$WSLENV') && executable('clip.exe') && executable('powershell.exe')
  let g:clipboard = {
        \   'name': 'WSL',
        \   'copy': {
        \      '+': 'clip.exe',
        \      '*': 'clip.exe'
        \    },
        \   'paste': {
        \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        \   },
        \   'cache_enabled': 0
        \ }
endif
