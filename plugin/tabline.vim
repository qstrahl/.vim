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

function! s:MyTabLine()
    let s = ''
    let s .= '%#TabLine#'
    let s .= '%<'
    let s .= '%(%{fnamemodify(getcwd(),":~")} %)'
    let s .= '%(%#TblGit#⌥ %{exists("b:git_dir")?fugitive#head(7):""}%#TabLine# %)'
    let s .= '%='
    let s .= '%([%{tabpagenr("$")>1?tabpagenr()."/".tabpagenr("$"):""}]%)'
    return s
endfunction

exe 'se tal=%!' . s:sid . 'MyTabLine()'
