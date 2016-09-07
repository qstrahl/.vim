"" This shit is super hacky. Don't even think of copying it
syn match css4Var /--\k*/ containedin=scssProperty
syn match scssAttributeWithNestedDefinition /:\s*[^#]*\ze{/ contained contains=cssMediaBlock

hi link scssSelectorChar scssSelectorName
hi link css4Var Normal
