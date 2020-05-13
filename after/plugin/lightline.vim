let g:lightline = {
      \ 'colorscheme': 'mine',
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': "\u007f", 'right': "\u0008" },
      \ 'active': {
      \   'left': [ [ 'buftype', 'filename' ], [ 'fugitive', 'modified' ] ],
      \   'right': [ [ 'lineinfo', 'percent' ], [ 'filetype' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-3v',
      \   'modified': '%{&modified?"":""}',
      \   'buftype': '%{get({"help":"","quickfix":""},&buftype,"")}'
      \ },
      \ 'component_function': {
      \   'buftype': 'LightlineBuftype',
      \   'fugitive': 'LightlineFugitive'
      \ },
      \ 'component_visible_condition': {
      \ 'buftype': '0',
      \ 'filename': '0',
      \ 'fugitive': '0',
      \ 'modified': '0',
      \ 'lineinfo': '0',
      \ 'percent': '0',
      \ 'flietype': '0'
      \ }
      \ }

" let s:first = {k,v -> v[0:0]}
" let g:lightline.inactive = map(copy(g:lightline.active), s:first)

let g:lightline.inactive = copy(g:lightline.active)

let s:buftypeicons = {"help": "", "quickfix": ""}

function! LightlineBuftype()
  return get(s:buftypeicons, &buftype, '')
endfunction

function! LightlineFugitive()
  if exists('*FugitiveStatusline') && exists('*FugitiveReal')
    if !len(FugitiveReal())
      return ''
    endif
    let line = FugitiveStatusline()
    let matches = matchlist(line, '\v\[Git([^()]+)?\((.*)\)\]')[1:]
    for item in matches
      if len(item)
        return '' . (item[0] ==# ':' ? '' : ':') . item
      endif
    endfor
  endif
  return ''
endfunction
