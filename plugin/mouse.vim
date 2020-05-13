" let s:clicks = [ '', '2-', '3-', '4-' ]
" let s:modemap = {
"       \ '': { 'Up': '<C-y>', 'Down': '<C-e>' },
"       \ 'i': { 'Up': '<C-x><C-y>', 'Down': '<C-x><C-e>' }
"       \ }

" for s:n in s:clicks
"   for [ s:mode, s:map ] in items(s:modemap)
"     for [ s:wheel, s:cmd ] in items(s:map)
"       let s:button = '<' . s:n . 'ScrollWheel' . s:wheel . '>'
"       let s:cmd = ':echo feedkeys("\\<ScrollWheelDown>", "n")<Bar>echo getchar(0) v:mouse_col v:mouse_lnum v:mouse_winid v:mouse_win<CR>'
"       exe s:mode . 'noremap' s:button s:cmd
"     endfor
"   endfor
" endfor
