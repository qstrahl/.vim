" Author: Quinn Strahl
" Best Ever: Bex

" Highlight Settings
hi CursorColumn          guibg=#f4f4f4
hi CursorLine            guibg=#f4f4f4
hi DbgBreakPt   gui=none guibg=#f0d0c0
hi DbgCurrent   gui=none guibg=#f0a080
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

" GUI-specific Options
se bg=light             " who uses dark backgrounds in GUIs?
se gfn=Terminus\ 9      " Terminus 9 is best gui font
se go =                 " guioptions
se go+=A                " autoselect for modeless selection
se go+=c                " use console dialogs instead of popups
se go+=i                " enable vim icon
