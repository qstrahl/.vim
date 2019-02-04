highlight! link Folded Comment
highlight! link SignColumn FoldColumn
highlight! link Substitute IncSearch

exe 'highlight DiffChange       gui=none        guibg=' . g:terminal_color_0 . '        guifg=none'
exe 'highlight DiffAdd          gui=none        guibg=#003333                           guifg=none'
exe 'highlight DiffText         gui=bold        guibg=#003366                           guifg=none'
exe 'highlight DiffDelete       gui=none        guibg=bg                                guifg=#663333'

exe 'highlight TabLine          gui=none        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_11
exe 'highlight TabLineSel       gui=none        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_14
highlight TabLineFill           gui=none

highlight StatusLine            gui=none
highlight StatusLineNC          gui=none
exe 'highlight VertSplit                        guibg=bg                                guifg=' . g:terminal_color_0
exe 'highlight WildMenu         gui=bold                                                guifg=' . g:terminal_color_15

highlight QuickFixLine          gui=bold

exe 'highlight ErrorSign        gui=bold        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_1
exe 'highlight StyleErrorSign   gui=none        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_1 
exe 'highlight WarningSign      gui=bold        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_3 
exe 'highlight StyleWarningSign gui=none        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_3 
exe 'highlight InfoSign         gui=bold        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_4 
exe 'highlight MessageSign      gui=bold        guibg=' . g:terminal_color_0 . '        guifg=fg'

exe 'highlight ALEError         gui=underline,bold      guibg=none                      guifg=' . g:terminal_color_1
exe 'highlight ALEStyleError    gui=underline,none      guibg=none                      guifg=' . g:terminal_color_1 
exe 'highlight ALEWarning       gui=underline,bold      guibg=none                      guifg=' . g:terminal_color_3 
exe 'highlight ALEStyleWarning  gui=underline,none      guibg=none                      guifg=' . g:terminal_color_3 
exe 'highlight ALEInfo          gui=underline,bold      guibg=none                      guifg=' . g:terminal_color_4 
exe 'highlight ALEMessage       gui=underline,bold      guibg=none                      guifg=fg'

highlight! link ALEErrorSign            ErrorSign
highlight! link ALEWarningSign          WarningSign
highlight! link ALEStyleErrorSign       StyleErrorSign
highlight! link ALEStyleWarningSign     StyleWarningSign
highlight! link ALEInfoSign             InfoSign
highlight! link ALEMessageSign          MessageSign
