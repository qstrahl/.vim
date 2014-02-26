function! s:SID ()
  let l:scripts = ""
  redir => l:scripts
  scriptnames
  redir END
  return "\<SNR>" . matchstr(split(l:scripts, '\n')[-1], '^\s*\zs\d\+\ze') . "_"
endfunction

if !exists('s:sid')
  silent let s:sid = s:SID()
endif

function! s:MyGitCommit(buf)
    try
        let commit = fugitive#buffer(a:buf).containing_commit()
        return commit == ':' ? 'HEAD' : commit == 'HEAD' ? '' : strpart(commit, 0, 7)
    catch /^fugitive:/
        return ''
    endtry
endfunction

function! s:MyBufferName(buf)
    let name = bufname(a:buf)

    if &buftype == 'quickfix'
        let name = exists('w:quickfix_title') ? w:quickfix_title : '[Quickfix List]'
    elseif name == ''
        let name = '[No Name]'
    else
        try
            let buf = fugitive#buffer(a:buf)
            let repo = buf.repo()
            let path = buf.path()
            let tree = repo.tree()

            if strlen(tree . '/' . path)
                let name = tree . '/' . path
            endif
        catch /^fugitive:/
            "" That's okay
        endtry
    endif

    return strlen(fnamemodify(name, ':~:.')) ? fnamemodify(name, ':~:.') : fnamemodify(name, ':~')
endfunction

function! s:MyQuickfixIndicator(bufnr)
  redir => buffers
  silent ls
  redir END

  let nr = a:bufnr
  for buf in split(buffers, '\n')
    if match(buf, '\v^\s*'.nr) > -1
      if match(buf, '\[Quickfix List\]') > -1
        return 'Q'
      else
        return 'L'
      endif
    endif
  endfor
  return ''
endfunction

function! s:MyStatusLine()
    let s = ''
    let s .= '%('
    let s .= '%#StlHelp#%{&buftype=="help"?"H":""}%*'
    let s .= '%#StlQuickfix#%{&buftype=="quickfix"?' . s:sid . 'MyQuickfixIndicator(bufnr("%")):""}%*'
    let s .= '%#StlPreview#%{&previewwindow?"P":""}%*'
    let s .= ' %)'
    let s .= '%<'
    let s .= '%{' . s:sid . 'MyBufferName(bufnr("%"))}'
    let s .= '%#StlGit#%( ⌥ %{' . s:sid . 'MyGitCommit(bufnr("%"))}%)%*'
    let s .= '%#StlModified#%( %{&modified?"+":""}%)%*'
    let s .= '%#StlSaved#%( %{!&modified && &modifiable?"✓":""}%)%*'
    " let s .= '%#StlReadOnly#%( %{!&modifiable||&readonly?"⚓":""}%)%*'
    let s .= '%='
    let s .= ' %l,%c%V'
    return s
endfunction

exe 'se stl=%!' . s:sid . 'MyStatusLine()'
