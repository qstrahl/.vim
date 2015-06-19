augroup QuickfixAutoOpen
    au!
    au QuickfixCmdPost [^l]*
        \ if len(getqflist()) > 1 |
            \ botright copen |
            \ wincmd p |
        \ endif
    au QuickfixCmdPost l*
        \ if len(getloclist(0)) > 1 |
            \ rightbelow lopen |
            \ wincmd p |
        \ endif
augroup END
