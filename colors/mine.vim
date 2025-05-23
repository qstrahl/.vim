let g:colors_name='mine'

" I am very opinionated.
" hi! clear

hi! Normal              cterm=none              ctermfg=none    ctermbg=none
hi! NormalNC            cterm=none              ctermfg=none    ctermbg=none

hi! link FloatBorder FloatTitle
hi! link NormalFloat Normal

" UI items
hi! ColorColumn         cterm=none              ctermfg=none    ctermbg=0
hi! Conceal             cterm=none              ctermfg=none    ctermbg=none
hi! Cursor              cterm=none              ctermfg=none    ctermbg=none
hi! CursorIM            cterm=none              ctermfg=none    ctermbg=none
hi! CursorColumn        cterm=none              ctermfg=none    ctermbg=0
hi! CursorLine          cterm=none              ctermfg=none    ctermbg=236
hi! Directory           cterm=bold              ctermfg=4       ctermbg=none
hi! EndOfBuffer         cterm=none              ctermfg=8       ctermbg=none
hi! ErrorMsg            cterm=italic            ctermfg=1       ctermbg=none
hi! TermCursor          cterm=none              ctermfg=none    ctermbg=none
hi! TermCursorNC        cterm=none              ctermfg=none    ctermbg=none
hi! FoldColumn          cterm=none              ctermfg=none    ctermbg=0
hi! Folded              cterm=none              ctermfg=8       ctermbg=none
hi! FoldedText          cterm=reverse           ctermfg=8       ctermbg=none
hi! DiffFolded          cterm=none              ctermfg=0       ctermbg=none
hi! DiffFoldedText      cterm=reverse           ctermfg=0       ctermbg=8
hi! IncSearch           cterm=bold              ctermfg=0       ctermbg=11
hi! LineNr              cterm=none              ctermfg=8       ctermbg=none
hi! CursorLineNr        cterm=none              ctermfg=none    ctermbg=236
hi! MatchParen          cterm=bold              ctermfg=15      ctermbg=none
hi! NonText             cterm=bold              ctermfg=8       ctermbg=0
hi! Pmenu               cterm=none              ctermfg=244     ctermbg=236
hi! PmenuSel            cterm=none              ctermfg=10      ctermbg=237
hi! PmenuSbar           cterm=none              ctermfg=247     ctermbg=237
hi! PmenuThumb          cterm=none              ctermfg=none    ctermbg=239
hi! QuickFixLine        cterm=none              ctermfg=none    ctermbg=236
hi! Search              cterm=none              ctermfg=0       ctermbg=11
hi! SpecialKey          cterm=none              ctermfg=12      ctermbg=0
hi! SpellBad            cterm=underline         ctermfg=9       ctermbg=none
hi! StatusLine          cterm=none              ctermfg=10      ctermbg=0
hi! StatusLineNC        cterm=none              ctermfg=8       ctermbg=0
hi! User1               cterm=bold              ctermfg=10      ctermbg=0
hi! Title               cterm=bold              ctermfg=none    ctermbg=none
hi! Todo                cterm=italic            ctermfg=10      ctermbg=none
hi! VertSplit           cterm=none              ctermfg=0       ctermbg=0
hi! WinSeparator        cterm=none              ctermfg=0       ctermbg=0
hi! Visual              cterm=none              ctermfg=none    ctermbg=238
hi! WarningMsg          cterm=italic            ctermfg=9       ctermbg=none
hi! Whitespace          cterm=reverse           ctermfg=none    ctermbg=none
hi! WildMenu            cterm=bold              ctermfg=0       ctermbg=10

hi! DiffDelete          cterm=reverse           ctermfg=235     ctermbg=none
hi! DiffAdd             cterm=none              ctermfg=none    ctermbg=235
hi! DiffChange          cterm=none              ctermfg=none    ctermbg=235
hi! DiffText            cterm=bold              ctermfg=none    ctermbg=236

hi! diffAdded           cterm=none              ctermfg=2       ctermbg=none
hi! diffRemoved         cterm=none              ctermfg=1       ctermbg=none
hi! link @text.diff.add diffAdded
hi! link @text.diff.delete diffRemoved

hi! ErrorSign           cterm=bold      ctermfg=1       ctermbg=0
hi! WarningSign         cterm=none      ctermfg=9       ctermbg=0
hi! StyleErrorSign      cterm=bold      ctermfg=3       ctermbg=0
hi! StyleWarningSign    cterm=none      ctermfg=5       ctermbg=0
hi! InfoSign            cterm=none      ctermfg=4       ctermbg=0
hi! MessageSign         cterm=none      ctermfg=6       ctermbg=0

hi! Comment              cterm=italic            ctermfg=8       ctermbg=none

hi! Constant             cterm=none              ctermfg=5       ctermbg=none
hi! link String Constant
" hi String               cterm=none              ctermfg=none    ctermbg=none
" hi Character            cterm=none              ctermfg=none    ctermbg=none
" hi Number               cterm=none              ctermfg=none    ctermbg=none
" hi Boolean              cterm=none              ctermfg=none    ctermbg=none
" hi Float                cterm=none              ctermfg=none    ctermbg=none

hi! Identifier           cterm=none              ctermfg=6       ctermbg=none
hi! link Function Identifier
hi! link @variable Identifier
" hi Function             cterm=none              ctermfg=none    ctermbg=none

hi! Statement            cterm=none              ctermfg=3       ctermbg=none
hi! link Operator Statement
" hi Conditional          cterm=none              ctermfg=none    ctermbg=none
" hi Repeat               cterm=none              ctermfg=none    ctermbg=none
" hi Label                cterm=none              ctermfg=none    ctermbg=none
" hi Operator             cterm=none              ctermfg=none    ctermbg=none
" hi Keyword              cterm=none              ctermfg=none    ctermbg=none
" hi Exception            cterm=none              ctermfg=none    ctermbg=none

hi! PreProc              cterm=none              ctermfg=4       ctermbg=none
" hi Include              cterm=none              ctermfg=none    ctermbg=none
" hi Define               cterm=none              ctermfg=none    ctermbg=none
" hi Macro                cterm=none              ctermfg=none    ctermbg=none
" hi PreCondit            cterm=none              ctermfg=none    ctermbg=none

hi! Type                 cterm=none              ctermfg=2       ctermbg=none
" hi StorageClass         cterm=none              ctermfg=none    ctermbg=none
" hi Structure            cterm=none              ctermfg=none    ctermbg=none
" hi Typedef              cterm=none              ctermfg=none    ctermbg=none

hi! Special              cterm=none              ctermfg=13      ctermbg=none
" hi SpecialChar          cterm=none              ctermfg=none    ctermbg=none
" hi Tag                  cterm=none              ctermfg=none    ctermbg=none
" hi SpecialComment       cterm=none              ctermfg=none    ctermbg=none
" hi Debug                cterm=none              ctermfg=none    ctermbg=none

hi! Underlined           cterm=underline         ctermfg=none    ctermbg=none

hi! Ignore               cterm=none              ctermfg=8       ctermbg=none

hi! Error                cterm=reverse           ctermfg=1       ctermbg=none

hi! Delimiter           cterm=none              ctermfg=8       ctermbg=none

"" The syntax highlighting for bash has some... opinions
hi! link @constant.bash Identifier
hi! link @function.builtin.bash @function.call.bash

hi! link SignColumn              FoldColumn
hi! link Substitute              IncSearch

hi! link TabLine                 StatusLineNC
hi! link TabLineFill             StatusLineNC
hi! link TabLineSel              StatusLine
hi! link StatusLineTerm          StatusLine
hi! link StatusLineTermNC        StatusLineNC
hi! link VisualNOS               Visual
hi! link Question                Comment
hi! link MoreMsg                 Question
hi! link ModeMsg                 MoreMsg
hi! link MsgSeparator            ModeMsg
hi! link SpellCap                SpellBad
hi! link SpellLocal              SpellBad
hi! link SpellRare               SpellBad

hi! link fzf1                    StatusLine
hi! link fzf2                    StatusLine
hi! link fzf3                    StatusLine

hi! link ALEErrorSign            ErrorSign
hi! link ALEWarningSign          WarningSign
hi! link ALEStyleErrorSign       StyleErrorSign
hi! link ALEStyleWarningSign     StyleWarningSign
hi! link ALEInfoSign             InfoSign
hi! link ALEMessageSign          MessageSign

"" LSP related stuff
hi! LspReference         cterm=bold,reverse ctermfg=none ctermbg=none
hi! link LspReferenceRead       LspReference
hi! link LspReferenceWrite      LspReference
hi! link LspReferenceText       LspReference

hi! DiagnosticError      cterm=italic    ctermfg=1
hi! DiagnosticWarn       cterm=italic    ctermfg=3
hi! DiagnosticHint       cterm=italic    ctermfg=2
hi! DiagnosticInfo       cterm=italic    ctermfg=4

hi! DiagnosticUnnecessary cterm=underline ctermbg=none ctermfg=none

" hi! DiagnosticFloatingError     cterm=italic    ctermfg=1       ctermbg=NONE
" hi! DiagnosticFloatingHint      cterm=italic    ctermfg=2       ctermbg=NONE
" hi! DiagnosticFloatingInfo      cterm=italic    ctermfg=4       ctermbg=NONE
" hi! DiagnosticFloatingWarn      cterm=italic    ctermfg=3       ctermbg=NONE

" hi! DiagnosticUnderlineError    cterm=underline ctermfg=NONE    ctermbg=NONE
" hi! DiagnosticUnderlineHint     cterm=underline ctermfg=NONE    ctermbg=NONE
" hi! DiagnosticUnderlineInfo     cterm=underline ctermfg=NONE    ctermbg=NONE
" hi! DiagnosticUnderlineWarn     cterm=underline ctermfg=NONE    ctermbg=NONE

hi! DiagnosticSignError         ctermfg=1       ctermbg=0
hi! DiagnosticSignHint          ctermfg=2       ctermbg=0
hi! DiagnosticSignInfo          ctermfg=4       ctermbg=0
hi! DiagnosticSignOk            ctermfg=2       ctermbg=0
hi! DiagnosticSignWarn          ctermfg=3       ctermbg=0

hi! link LspInfoBorder FloatBorder

hi! IndentBlanklineChar ctermfg=0

"" nvim-cmp overrides
hi! CmpItemKind cterm=italic ctermfg=241 ctermbg=none

"" telescope overrides
hi! link TelescopePromptCounter LineNr
hi! link TelescopeResultsDiffUntracked LineNr
hi! link TelescopePreviewHyphen LineNr
hi! link TelescopeMatching IncSearch
hi! link TelescopeBorder FloatBorder
hi! TelescopeResultsDiffUntracked       ctermfg=6
hi! TelescopeResultsDiffAdd             ctermfg=2
hi! TelescopeResultsDiffDelete          ctermfg=1
hi! TelescopeResultsDiffChange          ctermfg=3

"" fugitive overrides
hi! link fugitiveHelpTag Normal
hi! link fugitiveHeader Title
hi! link fugitiveHeading Title
hi! link fugitiveStagedHeading Title
hi! link fugitiveUnstagedHeading Title
hi! link fugitiveUntrackedHeading Title

hi! fugitiveCount                       ctermfg=13
hi! fugitiveStagedModifier              ctermfg=2
hi! fugitiveUnstagedModifier            ctermfg=3
hi! fugitiveUntrackedModifier           ctermfg=6
hi! fugitiveSymbolicRef                 ctermfg=5
