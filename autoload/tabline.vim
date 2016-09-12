function! tabline#dirname (buf, win, tab)
  try
    let dir = fugitive#buffer(a:buf).repo().tree()
  catch /^fugitive:/
    let dir = getcwd(a:win, a:tab)
  endtry
  return fnamemodify(dir, ':t')
endfunction

function! tabline#render ()
  let tabline = ''
  let tabline .= '%#TabLine#'
  let tabline .= '%<'

  let tab = 0
  let tabs = tabpagenr('$')
  let curtab = tabpagenr()

  for tab in range(tabs)
    let tab += 1
    let tabline .= '%' . tab . 'T'
    let tabline .= tab == curtab ? '%#TabLineSel#' : '%#TabLine#'
    let tabline .= ' %{tabline#label(' . tab . ')} '
  endfor

  let tabline .= '%#TabLineFill#%T'
  let tabline .= '%=%#TabLine#%999XX'

  return tabline
endfunction

function! tabline#label (tab)
  let win = tabpagewinnr(a:tab)
  let bufs = tabpagebuflist(a:tab)
  let buf = bufs[win - 1]

  try
    let dir = fugitive#buffer(buf).repo().tree()
  catch /^fugitive/
    let dir = getbufvar(buf, 'projectionist_file', getcwd(win, a:tab))
  endtry

  let label = fnamemodify(dir, ':t')

  return label
endfunction
