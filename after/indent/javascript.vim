function! MyJavascriptFormatter (lnum, count)
    if mode() == 'i'
        return 1
    elseif synIDattr(synIDtrans(synID(line('.'), col('.'), 0)), 'name') == 'Comment'
        return 1
    endif

    let l:options = []
    if &filetype =~# '\v^html\d?$'
        let l:options += [ '--type html' ]
    endif
    let l:options += [ '-l ' . indent(a:lnum) ]
    let l:options += [ &expandtab ? '-s ' . &shiftwidth : '-t' ]
    let l:options += [ '-w ' . &textwidth ]
    let l:options += [ '-q' ]
    let l:options += [ '-f -' ]
        
    keepjumps silent exe a:lnum . ',+' . (a:count - 1) . '!js-beautify ' . join(l:options, ' ')
    keepjumps undojoin | keepjumps silent exe "'[,']retab!"
    keepjumps undojoin | keepjumps silent exe "normal! '[V']="
    exe "normal \<C-o>\<C-o>\<C-i>"
endfunction

if executable('js-beautify')
    setlocal formatexpr=MyJavascriptFormatter(v:lnum,v:count)
endif
