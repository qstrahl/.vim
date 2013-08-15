highlight clear
if exists("syntax_on")
    syntax reset
endif

" Normal has to come first
hi Normal               cterm=none              ctermfg=252     ctermbg=234

set background=dark

" Built-in highlight groups
hi Comment              cterm=italic            ctermfg=243     ctermbg=none
hi Conceal              cterm=none              ctermfg=237     ctermbg=none
hi Cursor               cterm=none              ctermfg=0       ctermbg=255
hi CursorLine           cterm=none              ctermfg=none    ctermbg=235
hi CursorLineNr         cterm=bold              ctermfg=242     ctermbg=235
hi DiffAdd              cterm=none              ctermfg=none    ctermbg=22
hi DiffChange           cterm=none              ctermfg=none    ctermbg=53
hi DiffDelete           cterm=none              ctermfg=1       ctermbg=52
hi DiffText             cterm=none              ctermfg=15      ctermbg=5
hi FoldColumn           cterm=none              ctermfg=246     ctermbg=237
hi Folded               cterm=italic            ctermfg=246     ctermbg=237
hi Function             cterm=none              ctermfg=14      ctermbg=none
hi IncSearch            cterm=italic            ctermfg=fg      ctermbg=4
hi LineNr               cterm=none              ctermfg=239     ctermbg=none
hi Noise                cterm=none              ctermfg=242     ctermbg=none
hi NonText              cterm=none              ctermfg=237     ctermbg=none
hi Pmenu                cterm=none              ctermfg=27      ctermbg=18
hi PmenuSel             cterm=bold              ctermfg=15      ctermbg=20
hi PmenuSbar            cterm=none              ctermfg=none    ctermbg=17
hi PmenuThumb           cterm=none              ctermfg=250     ctermbg=26
hi Search               cterm=none              ctermfg=15      ctermbg=27
hi SignColumn           cterm=none              ctermfg=none    ctermbg=none
hi SpecialKey           cterm=none              ctermfg=14      ctermbg=23
hi StatusLine           cterm=bold              ctermfg=242     ctermbg=0
hi StatusLineNC         cterm=bold              ctermfg=236     ctermbg=0
hi TabLine              cterm=bold              ctermfg=236     ctermbg=0
hi TabLineFill          cterm=none              ctermfg=0       ctermbg=0
hi TabLineSel           cterm=bold              ctermfg=242     ctermbg=0
hi Title                cterm=bold              ctermfg=none    ctermbg=none
hi Todo                 cterm=bold,italic       ctermfg=243     ctermbg=none
hi VertSplit            cterm=none              ctermfg=236     ctermbg=0
hi Visual               cterm=none              ctermfg=none    ctermbg=238
hi WildMenu             cterm=bold              ctermfg=255     ctermbg=0

hi StlBufNum            cterm=none              ctermfg=15      ctermbg=0
hi StlFileHead          cterm=none              ctermfg=24      ctermbg=0
hi StlFileTail          cterm=none              ctermfg=32      ctermbg=0
hi StlIconModified      cterm=none              ctermfg=3       ctermbg=0
hi StlIconUnmodified    cterm=none              ctermfg=2       ctermbg=0
hi StlIconUnmodifiable  cterm=none              ctermfg=1       ctermbg=0
hi StlFugitiveHead      cterm=none              ctermfg=44      ctermbg=0
hi StlFlagBrackets      cterm=none              ctermfg=243     ctermbg=0
hi StlFlagBufType       cterm=underline         ctermfg=121     ctermbg=0
hi StlFlagPreview       cterm=underline         ctermfg=171     ctermbg=0
hi StlFlagReadOnly      cterm=underline         ctermfg=209     ctermbg=0
hi StlLine              cterm=none              ctermfg=15      ctermbg=0
hi StlLineComma         cterm=none              ctermfg=243     ctermbg=0
hi StlColumn            cterm=none              ctermfg=248     ctermbg=0
hi StlScrollPercent     cterm=none              ctermfg=15      ctermbg=0

hi! link CursorColumn CursorLine

" TODO: not suck

" Vdebug highlight groups
hi DbgBreakptLine       cterm=none              ctermfg=none    ctermbg=none
hi DbgBreakptSign       cterm=none              ctermfg=33      ctermbg=none
hi DbgCurrentLine       cterm=none              ctermfg=none    ctermbg=24
hi DbgCurrentSign       cterm=none              ctermfg=38      ctermbg=24

" Indent Guides highlight groups
hi IndentGuidesOdd      cterm=none              ctermfg=none    ctermbg=none
hi IndentGuidesEven     cterm=none              ctermfg=none    ctermbg=235

let g:colors_name = "qstrahl"
