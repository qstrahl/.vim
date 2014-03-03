highlight clear
if exists("syntax_on")
    syntax reset
endif

"" Normal has to come first
hi Normal               cterm=none              ctermfg=250     ctermbg=234

set background=dark

"" Built-in highlight groups
hi Comment              cterm=italic            ctermfg=243     ctermbg=none
hi Conceal              cterm=none              ctermfg=237     ctermbg=none
hi Cursor               cterm=none              ctermfg=0       ctermbg=15 
hi CursorLine           cterm=none              ctermfg=none    ctermbg=235
hi CursorLineNr         cterm=bold              ctermfg=242     ctermbg=235
hi DiffAdd              cterm=none              ctermfg=10      ctermbg=22
hi DiffChange           cterm=none              ctermfg=215     ctermbg=94
hi DiffDelete           cterm=none              ctermfg=9       ctermbg=52
hi DiffText             cterm=none              ctermfg=15      ctermbg=172
hi FoldColumn           cterm=none              ctermfg=246     ctermbg=237
hi Folded               cterm=italic            ctermfg=246     ctermbg=237
hi Function             cterm=none              ctermfg=14      ctermbg=none
hi IncSearch            cterm=italic            ctermfg=fg      ctermbg=4
hi LineNr               cterm=none              ctermfg=239     ctermbg=none
hi Noise                cterm=none              ctermfg=242     ctermbg=none
hi NonText              cterm=none              ctermfg=237     ctermbg=none
hi Pmenu                cterm=none              ctermfg=248     ctermbg=0
hi PmenuSel             cterm=bold              ctermfg=255     ctermbg=0
hi PmenuSbar            cterm=none              ctermfg=none    ctermbg=0
hi PmenuThumb           cterm=none              ctermfg=0       ctermbg=255
hi Search               cterm=none              ctermfg=15      ctermbg=27
hi SignColumn           cterm=none              ctermfg=none    ctermbg=none
hi SpecialKey           cterm=none              ctermfg=14      ctermbg=23
hi StatusLine           cterm=none              ctermfg=255     ctermbg=0
hi StatusLineNC         cterm=none              ctermfg=248     ctermbg=0
hi TabLine              cterm=bold              ctermfg=255     ctermbg=0
hi TabLineFill          cterm=none              ctermfg=255     ctermbg=0
hi TabLineSel           cterm=bold              ctermfg=255     ctermbg=0
hi Title                cterm=bold              ctermfg=none    ctermbg=none
hi Todo                 cterm=bold,italic       ctermfg=243     ctermbg=none
hi VertSplit            cterm=none              ctermfg=255     ctermbg=0
hi Visual               cterm=none              ctermfg=none    ctermbg=238
hi WildMenu             cterm=bold              ctermfg=255     ctermbg=0

"" Vdebug highlight groups
hi DbgBreakptLine       cterm=none              ctermfg=none    ctermbg=none
hi DbgBreakptSign       cterm=none              ctermfg=33      ctermbg=none
hi DbgCurrentLine       cterm=none              ctermfg=none    ctermbg=24
hi DbgCurrentSign       cterm=none              ctermfg=38      ctermbg=24

"" MatchParen
hi MatchParen           cterm=none              ctermfg=0       ctermbg=15

"" Syntastic
hi SyntasticError                               ctermfg=15      ctermbg=1
hi SyntasticWarning                             ctermfg=0       ctermbg=215
hi SyntasticErrorSign   cterm=bold              ctermfg=1       ctermbg=none
hi SyntasticWarningSign cterm=bold              ctermfg=215     ctermbg=none
hi link SyntasticStyleErrorSign SyntasticErrorSign
hi link SyntasticStyleWarningSign SyntasticWarningSign

"" Highlight links
hi! link CursorColumn CursorLine

"" Custom statusline highlight groups
hi StlHelp              cterm=bold              ctermfg=45      ctermbg=0
hi StlQuickfix          cterm=bold              ctermfg=85      ctermbg=0
hi StlPreview           cterm=bold              ctermfg=177     ctermbg=0
hi StlGit                                       ctermfg=110     ctermbg=0
hi StlModified                                  ctermfg=228     ctermbg=0
hi StlSaved                                     ctermfg=10      ctermbg=0
hi StlReadOnly                                  ctermfg=215     ctermbg=0

"" Custom tabline highlight groups
hi TblGit               cterm=bold              ctermfg=110     ctermbg=0

let g:colors_name = "qstrahl"
