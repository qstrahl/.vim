autocmd! VimResized * if &equalalways | wincmd = | endif
autocmd! TextChanged,InsertLeave * if &diff | diffupdate | endif
autocmd! Syntax * syntax sync fromstart
autocmd! QuitPre * autocmd plugin/autocmds WinLeave * wincmd p | exe 'doautocmd WinEnter' winnr() | autocmd! plugin/autocmds WinLeave

" what the fuck does this do? what was I trying to do?
autocmd! DirChanged * silent! !tmux attach -c "$PWD"
autocmd! VimEnter * let s:orig_cwd = getcwd()
autocmd! VimLeave * exe 'cd' fnameescape(s:orig_cwd)
autocmd! BufReadPre,BufWritePre * let &l:undofile = expand('<afile>:p') !~# '\v\f*/?\.git/\u+(_\u+)*'
