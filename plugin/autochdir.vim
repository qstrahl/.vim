function! s:AutoChdir (...)
  let leaving = a:0 ? eval(a:1) : 0

  if (leaving > 0)
    echomsg 'LEAVING' string(leaving) bufname(leaving)
  else
    echomsg 'ENTERING'
  endif

  let bufs = tabpagebuflist()

  let filters = []
  call add(filters, '(!empty(getbufvar(v:val, "dirvish")) || empty(getbufvar(v:val, "&buftype")))')
  call add(filters, '!getwinvar(v:key+1, "&previewwindow")')
  call add(filters, 'v:val != leaving')
  let filterexpr = join(filters, ' && ')

  echomsg 'filter:' string(bufs) filterexpr

  let bufs = filter(bufs, filterexpr)
  let files = map(bufs, 'fnamemodify(bufname(v:val), ":p:~")')

  if !len(files)
    return
  endif

  echomsg 'files:' string(files)

  let prefix = '^\V\%['
  let suffix = ']'
  let match = files[0]
  let files = files[1:]

  for file in files
    let match = matchstr(file, prefix . match . suffix)

    if empty(match)
      return
    endif
  endfor

  echomsg 'match:' string(match)

  let match = fnamemodify(match, ':p')
  let dir = isdirectory(match) ? match : fnamemodify(match, ':h')

  echomsg 'dir:' string(dir)

  try
    let gitdir = fugitive#repo(fugitive#extract_git_dir(dir)).tree()
    let dir = isdirectory(gitdir) ? gitdir : dir
  catch /./
  endtry

  if isdirectory(dir)
    echomsg 'Changing Tab Dir:' string(fnameescape(dir))
    exe 'tcd' fnameescape(dir)
  endif
endfunction

augroup AutoChdir
  autocmd!
  autocmd VimEnter * exe 'tabdo silent call s:AutoChdir() | tabnext' tabpagenr() | redraw
  autocmd BufWinEnter ?* silent call s:AutoChdir()
  autocmd BufWinLeave ?* silent call s:AutoChdir(expand('<abuf>'))
augroup END
