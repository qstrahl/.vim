let s:c00 = [ '', 00 ]
let s:c01 = [ '', 01 ]
let s:c02 = [ '', 02 ]
let s:c03 = [ '', 03 ]
let s:c04 = [ '', 04 ]
let s:c05 = [ '', 05 ]
let s:c06 = [ '', 06 ]
let s:c07 = [ '', 07 ]
let s:c08 = [ '', 08 ]
let s:c09 = [ '', 09 ]
let s:c10 = [ '', 10 ]
let s:c11 = [ '', 11 ]
let s:c12 = [ '', 12 ]
let s:c13 = [ '', 13 ]
let s:c14 = [ '', 14 ]
let s:c15 = [ '', 15 ]

let s:p                 = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ [ s:c00, s:c10 ], [ s:c10, s:c00 ] ]
let s:p.normal.right    = [ [ s:c10, s:c00 ], [ s:c10, s:c00 ] ]
let s:p.inactive.right  = [ [ s:c08, s:c00 ], [ s:c08, s:c00 ] ]
let s:p.inactive.left   = [ [ s:c08, s:c00 ], [ s:c08, s:c00 ] ]
let s:p.insert.left     = [ [ s:c00, s:c10 ], [ s:c10, s:c00 ] ]
let s:p.replace.left    = [ [ s:c00, s:c10 ], [ s:c10, s:c00 ] ]
let s:p.visual.left     = [ [ s:c00, s:c10 ], [ s:c10, s:c00 ] ]
let s:p.normal.middle   = [ [ s:c10, s:c00 ] ]
let s:p.inactive.middle = [ [ s:c08, s:c00 ] ]
let s:p.tabline.left    = [ [ s:c07, s:c00 ] ]
let s:p.tabline.tabsel  = [ [ s:c10, s:c00 ] ]
let s:p.tabline.middle  = [ [ s:c07, s:c00 ] ]
let s:p.normal.error    = [ [ s:c00, s:c01 ] ]
let s:p.normal.warning  = [ [ s:c00, s:c01 ] ]
let s:p.tabline.right   = copy(s:p.normal.right)

let g:lightline#colorscheme#mine#palette = lightline#colorscheme#flatten(s:p)
hi! LightlineLeft_active_0 cterm=bold,reverse ctermfg=10
hi! LightlineRight_active_0 cterm=bold,reverse ctermfg=10
hi! LightlineRight_active_0_1 cterm=bold ctermfg=10
