let b:sleuth_automatic = 0
setlocal expandtab shiftwidth=2

if !has_key(b:, 'undo_ftplugin')
  let b:undo_ftplugin = ''
else
  let b:undo_ftplugin .= '|'
endif

let b:undo_ftplugin = 'setlocal expandtab< shiftwidth<'
