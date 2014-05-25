silent! SyntasticToggleMode
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_checkers = ['jshint']

sign define SyntasticError text=‼ linehl=SyntasticErrorLine texthl=SyntasticErrorSign
sign define SyntasticWarning text=‼ linehl=SyntasticWarningLine texthl=SyntasticWarningSign
sign define SyntasticStyleError text=! linehl=SyntasticStyleErrorLine texthl=SyntasticStyleErrorSign
sign define SyntasticStyleWarning text=! linehl=SyntasticStyleWarningLine texthl=SyntasticStyleWarningSign
