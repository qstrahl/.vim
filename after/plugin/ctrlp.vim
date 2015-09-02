"" Don't want to get variable type mismatches
unlet g:ctrlp_custom_ignore
unlet g:ctrlp_user_command

let g:ctrlp_cache_dir = $HOME . '/.vim/cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\v[\/](coverage|dist|node_modules|bower_components|vendor)$'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'git ls-files -c -o --exclude-standard'],
  \ },
  \ 'fallback': 'find %s -type f',
  \ 'ignore': 1
\ }
