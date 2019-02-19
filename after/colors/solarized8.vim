highlight! link Folded Comment
highlight! link SignColumn FoldColumn
highlight! link Substitute IncSearch

highlight DiffChange            cterm=none      ctermbg=24      ctermfg=none
highlight DiffAdd               cterm=none      ctermbg=23      ctermfg=none
highlight DiffText              cterm=none      ctermbg=24      ctermfg=250  
highlight DiffDelete            cterm=none      ctermbg=bg      ctermfg=95
exe 'highlight DiffChange       gui=none        guibg=#183040                           guifg=none'
exe 'highlight DiffAdd          gui=none        guibg=#003333                           guifg=none'
exe 'highlight DiffText         gui=none        guibg=#2a4860                           guifg=#D0D0D0'
exe 'highlight DiffDelete       gui=none        guibg=bg                                guifg=#663333'

highlight TabLine               cterm=none      ctermbg=0       ctermfg=11
highlight TabLineSel            cterm=none      ctermbg=0       ctermfg=14
highlight TabLineFill           cterm=none
exe 'highlight TabLine          gui=none        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_11
exe 'highlight TabLineSel       gui=none        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_14
highlight TabLineFill           gui=none

highlight StatusLine            cterm=none
highlight StatusLineNC          cterm=none
highlight VertSplit                             ctermbg=bg      ctermfg=0
highlight WildMenu              cterm=bold                      ctermfg=15
highlight StatusLine            gui=none
highlight StatusLineNC          gui=none
exe 'highlight VertSplit                        guibg=bg                                guifg=' . g:terminal_color_0
exe 'highlight WildMenu         gui=bold                                                guifg=' . g:terminal_color_15

highlight QuickFixLine          cterm=bold
highlight QuickFixLine          gui=bold

highlight ErrorSign             cterm=bold      ctermbg=0       ctermfg=1
highlight StyleErrorSign        cterm=none      ctermbg=0       ctermfg=1 
highlight WarningSign           cterm=bold      ctermbg=0       ctermfg=3 
highlight StyleWarningSign      cterm=none      ctermbg=0       ctermfg=3 
highlight InfoSign              cterm=bold      ctermbg=0       ctermfg=4 
highlight MessageSign           cterm=bold      ctermbg=0       ctermfg=fg
exe 'highlight ErrorSign        gui=bold        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_1
exe 'highlight StyleErrorSign   gui=none        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_1 
exe 'highlight WarningSign      gui=bold        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_3 
exe 'highlight StyleWarningSign gui=none        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_3 
exe 'highlight InfoSign         gui=bold        guibg=' . g:terminal_color_0 . '        guifg=' . g:terminal_color_4 
exe 'highlight MessageSign      gui=bold        guibg=' . g:terminal_color_0 . '        guifg=fg'

highlight ALEError              cterm=underline,bold    ctermbg=none   ctermfg=1
highlight ALEStyleError         cterm=underline,none    ctermbg=none   ctermfg=1 
highlight ALEWarning            cterm=underline,bold    ctermbg=none   ctermfg=3 
highlight ALEStyleWarning       cterm=underline,none    ctermbg=none   ctermfg=3 
highlight ALEInfo               cterm=underline,bold    ctermbg=none   ctermfg=4 
highlight ALEMessage            cterm=underline,bold    ctermbg=none   ctermfg=fg
exe 'highlight ALEError         gui=underline,bold      guibg=none                      guifg=' . g:terminal_color_1
exe 'highlight ALEStyleError    gui=underline,none      guibg=none                      guifg=' . g:terminal_color_1 
exe 'highlight ALEWarning       gui=underline,bold      guibg=none                      guifg=' . g:terminal_color_3 
exe 'highlight ALEStyleWarning  gui=underline,none      guibg=none                      guifg=' . g:terminal_color_3 
exe 'highlight ALEInfo          gui=underline,bold      guibg=none                      guifg=' . g:terminal_color_4 
exe 'highlight ALEMessage       gui=underline,bold      guibg=none                      guifg=fg'

highlight! link fzf1 StatusLine
highlight! link fzf2 StatusLine
highlight! link fzf3 StatusLine

highlight! link ALEErrorSign            ErrorSign
highlight! link ALEWarningSign          WarningSign
highlight! link ALEStyleErrorSign       StyleErrorSign
highlight! link ALEStyleWarningSign     StyleWarningSign
highlight! link ALEInfoSign             InfoSign
highlight! link ALEMessageSign          MessageSign
