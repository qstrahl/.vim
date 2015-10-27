function! MyJavascriptFormatter (lnum, count)
    if mode() == 'i'
        return 1
    elseif synIDattr(synIDtrans(synID(line('.'), col('.'), 0)), 'name') == 'Comment'
        return 1
    endif

    let l:options = []
    let l:options += [ &expandtab ? '-s ' . &shiftwidth : '-t' ]
    let l:options += [ '-w ' . &textwidth ]
    let l:options += [ '-q' ]
    let l:options += [ '-b "expand"' ]
    let l:options += [ '-f -' ]
        
    silent exe a:lnum . ',+' . (a:count - 1) . '!js-beautify ' . join(l:options, ' ')
    undojoin | silent exe "'[,']retab!"
endfunction

if executable('js-beautify')
    setlocal formatexpr=MyJavascriptFormatter(v:lnum,v:count)
endif
