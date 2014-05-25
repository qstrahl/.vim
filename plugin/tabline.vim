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

function! s:MyDirName()
  try
    let dir = fugitive#repo().tree()
  catch /^fugitive:/
    let dir = getcwd()
  endtry

  return fnamemodify(dir, ':~')
endfunction

function! s:MyTabLine()
    let s = ''
    let s .= '%#TabLine#'
    let s .= '%<'
    let s .= '%(%{' . s:sid . 'MyDirName()} %)'
    let s .= '%(⌥ %{exists("b:git_dir")?fugitive#head(7):""} %)'
    let s .= '%='
    let s .= '%([%{tabpagenr("$")>1?tabpagenr()."/".tabpagenr("$"):""}]%)'
    return s
endfunction

exe 'se tal=%!' . s:sid . 'MyTabLine()'
