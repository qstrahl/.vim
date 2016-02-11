augroup QuickfixAutoOpen
    au!
    au QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd,cscope,cfile,cgetfile,caddfile,helpgrep,cexpr
        \ if len(getqflist()) > 1 |
            \ botright copen |
            \ wincmd p |
        \ endif
    au QuickfixCmdPost lhelpgrep,laddfile,lgetfile,lfile,lvimgrepadd,lvimgrep,lgrepadd,lgrep,lmake,lexpr
        \ if len(getloclist(0)) > 1 |
            \ rightbelow lopen |
            \ wincmd p |
        \ endif
augroup END
