" Author: Quinn Strahl
" Best Ever: Bex

" Highlight Settings
hi CursorColumn guibg=#f4f4f4
hi CursorLine   guibg=#f4f4f4
hi DbgBreakPt   guibg=#f0d0c0 gui=none
hi DbgCurrent   guibg=#f0a080 gui=none
hi DiffAdd      guibg=#e0ffe0
hi DiffDelete   guibg=#ffb0b0 guifg=#ff0000
hi DiffChange   guibg=#ffe0ff
hi DiffText     guibg=#ff00ff guifg=#ffffff
hi Folded       guibg=#e0e0f0 guifg=#0000cc
hi Visual       guibg=#e0e0e0

" GUI-specific Options
se bg=light             " who uses dark backgrounds in GUIs?
se gfn=Terminus\ 9      " Terminus 9 is best gui font
se go =                 " guioptions
se go+=A                " autoselect for modeless selection
se go+=c                " use console dialogs instead of popups
se go+=i                " enable vim icon
