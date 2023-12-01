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

    "" Open the super special status window
    Git

    "" Store the handle of the status window
    let s:statuswin = nvim_get_current_win()

    "" Turn it into a super cool floating window
    call nvim_win_set_config(s:statuswin, config)

    "" Restore the layout of the windows from before
    exe cmd

    "" search for the previous file name in the git status buffer
    let lines = getbufline('%', 1, '$')
    let matchline = indexof(lines, s:matches_prev_bufname) + 1

    "" if it's in there, highlight it - otherwise, jump to the first file
    if matchline
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

"" Custom fugitive maps for oft-needed commands
nnoremap <Leader>gs <Cmd>call <SID>OpenStatus()<CR>

nnoremap <Leader>gd <Cmd>Gdiffsplit!<CR>
nnoremap <Leader>ge <Cmd>Gedit<CR>
nnoremap <Leader>gl <Cmd>Gllog<CR>

nnoremap <Leader>gD <Cmd>Git difftool -y<CR>
nnoremap <Leader>gm <Cmd>Git mergetool -y<CR>
