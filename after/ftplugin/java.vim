let java_highlight_java_lang_ids = 1
let java_minlines = 50
let java_highlight_all = 1
" let java_highlight_functions = "indent"
let java_highlight_functions = "style"
let b:deoplete_sources = [ 'buffer', 'omni' ]

noremap <silent> <buffer> <C-]> :JavaSearchContext -a edit<CR>
noremap <silent> <buffer> <C-w>] :JavaSearchContext -a sp<CR>
noremap <silent> <buffer> <C-w><C-]> :JavaSearchContext -a sp<CR>

noremap <silent> <buffer> <Leader>i :JavaImport<cR>
noremap <silent> <buffer> <Leader>o :JavaImportOrganize<cR>

setlocal tabstop=2
