"" Expressions that get applied over lists, made vars for readability
let s:notCurrentBuffer   = 'v:val != bufnr("%")'
let s:getReadableBufSpec = 'len(bufname(v:val)) ? fnamemodify(bufname(v:val), ":~:.") : string(v:val)'
let s:isDiffed           = 'getwinvar(v:key + 1, "&diff")'

"" Return completion options for Diffget / Diffput commands
function! s:Complete (ArgLead, CmdLine, CursorPos)
  "" Return shortened pathnames of open diffs (excluding current buffer)
  return map(s:Diffs(), s:getReadableBufSpec)
endfunction

"" Return list of bufspecs in open diffed windows
function! s:Diffs ()
  return filter(filter(tabpagebuflist(), s:isDiffed), s:notCurrentBuffer)
endfunction

"" Return the bufspec for diff number "count"; "count" is the 1-based index among diffed windows
"" NOTE: A "count" of 0 or an out-of-bounds "count" returns empty string
function! s:Diff (count)
  return a:count ? get(s:Diffs(), a:count - 1, '') : ''
endfunction

"" Define custom diffget/diffput commands with completion
command! -complete=customlist,<SID>Complete -nargs=? -range Diffget     <line1>,<line2>diffget <args>|diffupdate
command! -complete=customlist,<SID>Complete -nargs=? -range DGET        <line1>,<line2>diffget <args>|diffupdate
command! -complete=customlist,<SID>Complete -nargs=? -range Dget        <line1>,<line2>diffget <args>|diffupdate
command! -complete=customlist,<SID>Complete -nargs=? -range Diffput     <line1>,<line2>diffput <args>|diffupdate
command! -complete=customlist,<SID>Complete -nargs=? -range DPUT        <line1>,<line2>diffput <args>|diffupdate
command! -complete=customlist,<SID>Complete -nargs=? -range Dput        <line1>,<line2>diffput <args>|diffupdate

"" Define maps that interpret count as 1-based index among diffed windows
nnoremap <expr> <Plug>(Diffget) <SID>Diff(v:count).'do'
nnoremap <expr> <Plug>(Diffput) <SID>Diff(v:count).'dp'
vnoremap <expr> <Plug>(Diffget) ':diffget '.<SID>Diff(v:count).'<Bar>diffupdate<CR>'
vnoremap <expr> <Plug>(Diffput) ':diffput '.<SID>Diff(v:count).'<Bar>diffupdate<CR>'

"" Override default normal mode mappings
nmap do <Plug>(Diffget)
nmap dp <Plug>(Diffput)

"" Add visual mode mappings
vmap <C-o> <Plug>(Diffget)
vmap <C-p> <Plug>(Diffput)

augroup MyDiffMagic
  autocmd!
  autocmd InsertLeave,TextChanged * if &diff | diffupdate | endif
augroup END
