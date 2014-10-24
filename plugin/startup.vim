let s:stdin = 0

function! s:should_explore ()
  return !argc() && !s:stdin
endfunction

augroup MyStartup
    au!
    au StdinReadPre * let s:stdin = 1
    au VimEnter * if s:should_explore() | Explore
augroup END
