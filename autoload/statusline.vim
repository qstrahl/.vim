let s:left = [['modified', 'pvw', 'buftype', 'bufname'], ['%<', 'git']]
let s:right = [['lineinfo'], ['filetype']]

let s:qfleft = [['pvw', 'qftype', 'qftitle'], ['git']]
let s:qfright = [['qfnr'], ['filetype']]

let s:tpl = map({
      \   'hi': '%%%d*%s%%*',
      \  'pad': '%s%s',
      \ 'item': '%%(%s%%)',
      \ 'func': '%%{statusline#%s()}',
      \ 'dict': '%%{get(statusline#%s,%s,"")}'
      \ }, {_, tpl -> function('printf', [tpl])})

let s:items = {
      \ 'bufname': '%t%{expand("%")[-1:] is "/"?expand("%:h:t"):""}',
      \ 'lineinfo': ' %3l:%-2v %P',
      \ 'qftitle': '%{get(w:,"quickfix_title","")}',
      \ 'qfnr': ' %2{line(".")}   %{line("$")}',
      \ 'qftype': '%{len(getloclist(0))?"":""}',
      \ 'filetype': '%{devicon#get(&filetype)}'
      \ }

for name in ['git'] " funcs
  let s:items[name] = s:tpl.func(name)
endfor

for name in ['modified', 'buftype', 'pvw'] " option dicts
  let s:items[name] = s:tpl.dict(name, '&' . name)
endfor

let statusline#items = s:items

let s:sep = [' ', ' ']
let s:hi = {i, item -> s:tpl.hi(!i, item)}
let s:rev = {r, items -> r ? reverse(copy(items)) : items}
let s:pad = {r, item -> call(s:tpl.pad, s:rev(r, [' ', item]))}
let s:get = {item -> get(s:items, item, item)}
let s:item = {r -> {i, item -> s:tpl.item(s:pad(r, s:get(item)))}}
let s:sect = {r -> {i, sect -> s:hi(i, join(map(sect, s:item(r)), ''))}}
let s:side = {i, side -> join(s:rev(i, map(side, s:sect(i))), s:sep[i])}

let s:qfline = join(map([ s:qfleft, s:qfright ], s:side), '%=')
let s:statusline = join(map([ s:left, s:right ], s:side), '%=')

function! statusline#render ()
  let &statusline = s:statusline
  redrawstatus!
endfunction

let statusline#buftype = {'help': '', 'terminal': ''}
let statusline#modified = {1: 'פֿ'}
let statusline#pvw = {1: ''}

function! statusline#git ()
  if exists('*FugitiveStatusline') && exists('*FugitiveReal')
    if !len(FugitiveReal())
      return ''
    endif
    let line = FugitiveStatusline()
    let matches = matchlist(line, '\v\[Git([^()]+)?\((.*)\)\]')[1:]
    for item in matches
      if len(item)
        return '' . ' ' . get(split(item, '/'), 0, item)
      endif
    endfor
  endif
  return ''
endfunction

autocmd! BufWinEnter * let &l:stl = &bt ==# 'quickfix' ? s:qfline : ''
autocmd! BufWinLeave * let &l:stl = ''
