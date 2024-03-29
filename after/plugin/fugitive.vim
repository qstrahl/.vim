let s:matches_prev_bufname = 'worktree . "/" . v:val[2:] ==# FugitivePath(prevfile)'

"" Opens git status buffer in a transitory floating window
function! s:OpenStatus()
  let worktree = FugitiveWorkTree()
  let prevfile = expand('%')

  if !len(worktree)
    "" if not in a git repo, commit petty plugin fraud
    try
      Git
    catch /^Vim(echoerr):fugitive: .*$/
      echohl ErrorMsg
      echo matchstr(v:exception, 'fugitive: .*')
      echohl None
    endtry
  elseif !exists('s:statuswin')
    let config = {}
    let config.relative = 'editor'
    let config.border = 'rounded'
    let config.title = ' Git Status '
    let config.title_pos = "center" 
    let config.col = 0
    let config.row = 0
    let config.width = 1
    let config.height = 1

    "" Remember the current layout of all the 
    let cmd = winrestcmd()
    let view = winsaveview()

    "" Open the super special status window
    botright Git

    "" Store the handle of the status window
    let s:statuswin = nvim_get_current_win()

    "" Turn it into a super cool floating window
    call nvim_win_set_config(s:statuswin, config)

    "" Restore the layout of the windows from before
    noautocmd exe cmd
    noautocmd wincmd p
    noautocmd call winrestview(view)
    noautocmd wincmd p

    "" search for the previous file name in the git status buffer
    let lines = getbufline('%', 1, '$')
    let matchline = indexof(lines, s:matches_prev_bufname) + 1

    "" if it's in there, highlight it - otherwise, jump to the first file
    "" (the first 5 lines are taken up by static text)
    if matchline > 5
      exe matchline
    else
      normal )
    endif

    autocmd! VimResized,TextChanged <buffer> call s:AdjustStatus()
    autocmd! BufLeave <buffer> call s:CloseStatus()
    call s:AdjustStatus()
  endif
endfunction

"" Adjusts status window width/height and centers it
function! s:AdjustStatus ()
  if exists('s:statuswin')
    let config = copy(nvim_win_get_config(s:statuswin))

    let lastline = line('$', s:statuswin)
    let lastcols = map(range(1, lastline), "virtcol([v:val, '$'])")
    let lastcol = max(lastcols) - 1
    let config.width = max([ lastcol, min([ 80, &columns / 2 ]) ])
    let config.height = max([ 1, min([ &lines - 3, lastline ]) ])
    let config.row = (&lines - config.height) / 2
    let config.col = (&columns - config.width) / 2

    call nvim_win_set_config(s:statuswin, config)
  endif
endfunction

"" Closes floating git status window
function! s:CloseStatus ()
  if exists('s:statuswin')
    call nvim_win_close(s:statuswin, 1)
    unlet s:statuswin
  endif
endfunction

"" Auto-diff new fugitive buffers in tabs containing diffs of the same file
function! s:KeepDiff()
  if !get(w:, 'keep_diff')
    return
  endif

  let tabnr = tabpagenr()
  let [ tabinfo ] = gettabinfo(tabnr)

  for win in tabinfo.windows
    if getwinvar(win, '&diff')
      diffthis
      normal ]c[czM
      return
    endif
  endfor
endfunction

function! s:DiffLog()
  let bufname = expand('%:s?^oil://??')

  if isdirectory(bufname)
    exe 'Gclog --' bufname
  else
    let tabnr = tabpagenr()
    let [ tabinfo ] = gettabinfo(tabnr)
    if len(tabinfo.windows) > 1
      tab sb
    endif
    diffthis
    let w:keep_diff = 1
    leftabove vsp
    let w:keep_diff = 1
    botright 0Gclog
    2wincmd w
    wincmd p
  endif
endfunction

augroup MyFugitive
  autocmd!
  autocmd FileType help call FugitiveDetect(@%)
  autocmd BufWinEnter * call s:KeepDiff()
augroup END

"" Custom fugitive maps for oft-needed commands
nnoremap <Leader>gs <Cmd>call <SID>OpenStatus()<CR>

nnoremap <Leader>gd <Cmd>Gdiffsplit!<CR>
nnoremap <Leader>ge <Cmd>Gedit<CR>
nnoremap <Leader>gl <Cmd>call <SID>DiffLog()<CR>

nnoremap <Leader>gD <Cmd>Git difftool -y<CR>
nnoremap <Leader>gm <Cmd>Git mergetool -y<CR>
