" vim: set fdm=marker:
" Author: Quinn Strahl

" [ Color & Highlights ] {{{

se bg=light

hi CursorColumn          guibg=#f4f4f4
hi CursorLine            guibg=#f4f4f4
hi DiffAdd               guibg=#e0ffe0
hi DiffDelete            guibg=#ffb0b0 guifg=#ff0000
hi DiffChange            guibg=#ffe0ff
hi DiffText              guibg=#ff00ff guifg=#ffffff
hi Folded                guibg=#e0e0f0 guifg=#0000cc
hi IncSearch    gui=none guibg=#ffff00
hi Search       gui=none guibg=#ffff00
hi StatusLine   gui=none guibg=#000000 guifg=#ffffff
hi StatusLineNC gui=none guibg=#000000 guifg=#909090
hi Visual                guibg=#e0e0e0

" }}}

" [ Fonts ] {{{

se gfn=Terminus\ 9

" }}}

" [ GUI Options ] {{{

se go =
se go+=c
se go+=e

" }}}
