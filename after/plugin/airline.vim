if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_inactive_collapse=1
let g:airline_section_a = '%{fnamemodify(getcwd(), ":t")}'
let g:airline_section_c = '%{qstrahl#bufname()}%{qstrahl#modified()}'
let g:airline_section_z = '%3p%% %{g:airline_symbols.linenr}%4l:%3c'
