set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "qstrahl"

" Normal has to come first
hi Normal               cterm=none      ctermfg=252     ctermbg=234

" Built-in highlight groups
hi Comment              cterm=italic    ctermfg=243     ctermbg=none
hi Conceal              cterm=none      ctermfg=237     ctermbg=none
hi Cursor               cterm=none      ctermfg=0       ctermbg=255
hi CursorLine           cterm=none      ctermfg=none    ctermbg=235
hi CursorLineNr         cterm=bold      ctermfg=242     ctermbg=235
hi DiffAdd              cterm=none      ctermfg=none    ctermbg=22
hi DiffChange           cterm=none      ctermfg=none    ctermbg=53
hi DiffDelete           cterm=none      ctermfg=1       ctermbg=52
hi DiffText             cterm=none      ctermfg=15      ctermbg=5
hi FoldColumn           cterm=none      ctermfg=246     ctermbg=237
hi Folded               cterm=italic    ctermfg=246     ctermbg=237
hi IncSearch            cterm=italic    ctermfg=fg      ctermbg=4
hi NonText              cterm=none      ctermfg=237     ctermbg=none
hi LineNr               cterm=none      ctermfg=239     ctermbg=none
hi Pmenu                cterm=none      ctermfg=27      ctermbg=18
hi PmenuSel             cterm=bold      ctermfg=15      ctermbg=20
hi PmenuSbar            cterm=none      ctermfg=none    ctermbg=17
hi PmenuThumb           cterm=none      ctermfg=250     ctermbg=26
hi Search               cterm=none      ctermfg=15      ctermbg=27
hi SignColumn           cterm=none      ctermfg=none    ctermbg=none
hi SpecialKey           cterm=none      ctermfg=14      ctermbg=23
hi StatusLine           cterm=bold      ctermfg=242     ctermbg=0
hi StatusLineNC         cterm=bold      ctermfg=236     ctermbg=0
hi TabLine              cterm=bold      ctermfg=236     ctermbg=0
hi TabLineFill          cterm=none      ctermfg=0       ctermbg=0
hi TabLineSel           cterm=bold      ctermfg=242     ctermbg=0
hi Title                cterm=bold      ctermfg=none    ctermbg=none
hi VertSplit            cterm=none      ctermfg=236     ctermbg=0
hi Visual               cterm=none      ctermfg=none    ctermbg=238
hi WildMenu             cterm=bold      ctermfg=255     ctermbg=0
hi! link CursorColumn CursorLine

" Vdebug highlight groups
hi DbgBreakptLine       cterm=none      ctermfg=none    ctermbg=none
hi DbgBreakptSign       cterm=none      ctermfg=33      ctermbg=none
hi DbgCurrentLine       cterm=none      ctermfg=none    ctermbg=24
hi DbgCurrentSign       cterm=none      ctermfg=38      ctermbg=24
