"" Enable <CR> expansion in delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_insert_eol_marker = 2

au FileType javascript,java,c let b:delimitMate_eol_marker = ';'
