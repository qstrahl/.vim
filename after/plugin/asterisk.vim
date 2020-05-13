map *   <Plug>(asterisk-z*)
map #   <Plug>(asterisk-z#)
map g*  <Plug>(asterisk-zg*)
map g#  <Plug>(asterisk-zg#)

for op in ['*', '#', 'g*', 'g#']
  let n = {'*':'n', '#':'N'}[op[-1:]]
  exe "onoremap <expr> " . op . " '\<C-\>\<C-N>:normal " . op . "\<CR>' . v:operator . 'g" . n . "'"
endfor
unlet op n
