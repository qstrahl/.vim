augroup CustomVdebugConfig
  au!
  au User VdebugPost
    \ exe 'sign define breakpt text=◆' |
    \ exe 'sign define current text=▶' |
    \ hi clear DbgBreakptLine DbgBreakptSign DbgCurrentLine DbgCurrentSign
augroup END
