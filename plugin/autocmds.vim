"" Automatically source vim files when written
augroup AutoSource
  autocmd!
  autocmd BufWritePost init.vim,*/{autoload,plugin}/*.vim silent! if filereadable(resolve(expand('<afile>'))) | source <afile> | endif
augroup END

augroup MyAutocmds
  au!
  au BufWritePre,FileWritePre ?*
    \ if expand('<afile>') !~? '^[a-z0-9]\+:\/\/' |
        \ silent! call mkdir(expand('<afile>:h'), 'p') |
    \ endif
  au BufWritePre * let &bex=strftime(".%F.%T.vimbackup")
  au BufAdd ?* exe 'set sua+=.'.expand('<amatch>:e')
  au VimResized * wincmd =
  au CmdWinEnter * setlocal nonumber
  au BufWinEnter * if &previewwindow  | set winfixwidth winfixheight | endif
  au BufWritePost,BufLeave,WinLeave,QuitPre ?* silent! mkview!
  au BufWinEnter ?* silent! loadview
  autocmd ColorScheme * hi! link SignColumn FoldColumn
  autocmd ColorScheme * silent! exe 'runtime! after/colors/' . expand('<amatch>') . '.vim'
augroup END
