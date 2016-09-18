function! tabline#dirname (buf, win, tab)
  try
    let dir = fugitive#buffer(a:buf).repo().tree()
  catch /^fugitive:/
    let dir = getcwd(a:win, a:tab)
  endtry
  return fnamemodify(dir, ':t')
endfunction

function! tabline#branch ()
  try
    let repo = fugitive#repo(fugitive#extract_git_dir(1))
    return repo.head(7)
  catch /./
    return ''
  endtry
endfunction

function! tabline#render ()
  let curtab = tabpagenr()

  let tabline = ''
  let tabline .= '%#TabLine#'
  let tabline .= '%{tabline#label(tabpagenr(), ":p:~")}'
  let tabline .= '%( ⑂ %{tabline#branch()}%)'

  "" indecisiveness
  let tabline .= '%( ⊟ %{tabpagewinnr(tabpagenr(), "$")}%)'
  " let tabline .= '%( ⊞ %{tabpagewinnr(tabpagenr(), "$")}%)'

  let tabline .= '%<'
  let tabline .= '%='

  let tab = 0
  let tabs = tabpagenr('$')

  for tab in range(tabs)
    let tab += 1
    let tabline .= '%' . tab . 'T'
    let tabline .= tab == curtab ? '%#TabLineSel#' : '%#TabLine#'
    let tabline .= ' %{tabline#label(' . tab . ')} '
    let tabline .= '%#TabLine#'
  endfor

  " let tabline .= '%#TabLineFill#%T'
  " let tabline .= '%#TabLine#%999XX'

  return tabline
endfunction

function! tabline#label (tab, ...)
  return fnamemodify(getcwd(-1, a:tab), get(a:, 1, ':t'))

  let win = tabpagewinnr(a:tab)
  let bufs = tabpagebuflist(a:tab)
  let buf = bufs[win - 1]

  let pre = ''
  let dir = ''
  let etc = ''
  let label = ''

  try
    let repo = fugitive#buffer(buf).repo()
    let pre = '⑂'
    let dir = repo.tree()
  catch /^fugitive/
    let pre = '}'
    let dir = getbufvar(buf, 'projectionist_file', '')
    if dir == fnamemodify(bufname(buf), ':p')
      let dir = ''
    endif
  endtry

  if empty(dir)
    let pre = '$' 
    let dir = getcwd(-1)
  endif

  " if !empty(pre)
  "   let label .= pre . ' '
  " endif

  let label .= fnamemodify(dir, get(a:, 1, ':t'))

  if !empty(etc)
    let label .= ' [' . etc . ']'
  endif

  return label
endfunction

set tabline=%!tabline#render()
