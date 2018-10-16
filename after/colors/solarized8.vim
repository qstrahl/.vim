highlight! link Folded Comment
highlight! link SignColumn FoldColumn
highlight! link Substitute IncSearch

highlight Comment               cterm=italic

highlight DiffChange            cterm=none      ctermbg=0       ctermfg=none
highlight DiffAdd               cterm=none      ctermbg=23      ctermfg=none
highlight DiffText              cterm=bold      ctermbg=24      ctermfg=none
highlight DiffDelete            cterm=none      ctermbg=bg      ctermfg=95

highlight TabLine               cterm=none      ctermbg=0       ctermfg=11
highlight TabLineSel            cterm=none      ctermbg=0       ctermfg=14
highlight TabLineFill           cterm=none

highlight StatusLine            cterm=none
highlight StatusLineNC          cterm=none
highlight VertSplit                             ctermbg=bg      ctermfg=0
highlight WildMenu              cterm=bold                      ctermfg=15

highlight QuickFixLine          cterm=bold

highlight ErrorSign             cterm=bold      ctermbg=0       ctermfg=1
highlight StyleErrorSign        cterm=none      ctermbg=0       ctermfg=1 
highlight WarningSign           cterm=bold      ctermbg=0       ctermfg=3 
highlight StyleWarningSign      cterm=none      ctermbg=0       ctermfg=3 
highlight InfoSign              cterm=bold      ctermbg=0       ctermfg=4 
highlight MessageSign           cterm=bold      ctermbg=0       ctermfg=fg

highlight! link ALEErrorSign            ErrorSign
highlight! link ALEWarningSign          WarningSign
highlight! link ALEStyleErrorSign       StyleErrorSign
highlight! link ALEStyleWarningSign     StyleWarningSign
highlight! link ALEInfoSign             InfoSign
highlight! link ALEMessageSign          MessageSign
