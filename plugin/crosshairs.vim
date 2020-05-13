let s:opts = ['cursorline', 'cursorcolumn']
let s:opt = function('printf', ['&%s'])
let s:var = function('printf', ['crosshairs_%s'])
let s:winvar = {fn, fmt -> {win, opt, ... -> call(fn, [win, fmt(opt)] + a:000)}}
let s:getopt = s:winvar(function('getwinvar'), s:opt)
let s:getvar = s:winvar(function('getwinvar'), s:var)
let s:setopt = s:winvar(function('setwinvar'), s:opt)
let s:setvar = s:winvar(function('setwinvar'), s:var)
let s:set = {opt, from, get, to, set -> s:set{set}(to, opt, s:get{get}(from, opt, 0))}
let s:setall = {opts, from, get, to, set -> map(copy(opts), {i, opt -> s:set(opt, from, get, to, set)})}
let s:setopts = {opts, win, val -> map(copy(opts), {i, opt -> s:setopt(win, opt, val)})}
let s:bound = {win -> s:getopt(win, 'scrollbind')}

let s:quickfix = {win -> getbufvar(winbufnr(win), '&buftype') is 'quickfix'}
let s:index = {win -> getbufvar(winbufnr(win), 'fugitive_type') is 'index'}
let s:ignore = {win -> s:quickfix(win) || s:index(win)}

" function! s:cache (opts, win)
"   call s:setall(a:opts, a:win, 'opt', a:win, 'var')
"   call s:sync(a:opts, a:win, 'var', 'opt')
" endfunction

" function! s:scrollbind (win)
"   let opt = 'cursorline'
"   call s:setopts([opt], a:win, s:bound(a:win) || s:getvar(a:win, opt, 0))
"   call s:sync([opt], a:win, 'opt', 'opt')
" endfunction

" function! s:sync (opts, win, get, set)
"   let wins = range(1, winnr('$'))
"   let ShouldSync = {win -> s:bound(a:win) ? s:bound(win) : win is a:win}
"   let Sync = {win -> s:setall(a:opts, a:win, a:get, win, a:set)}
"   let Disable = {win -> s:ignore(win) ? 0 : s:setopts(a:opts, win, 0)}
"   let SyncWin = {i, win -> ShouldSync(win) ? Sync(win) : Disable(win)}
"   call map(wins, SyncWin)
" endfunction

" autocmd! OptionSet cursor{line,column} call s:cache([expand('<amatch>')], winnr())
" autocmd! FileType * call s:cache(s:opts, winnr())
" autocmd! OptionSet diff,scrollbind call s:scrollbind(winnr())
" autocmd! BufWinEnter,BufWinLeave,DiffUpdated * call s:scrollbind(winnr())
" autocmd! WinEnter * call s:scrollbind(winnr()) | call s:sync(s:opts, winnr(), 'var', 'opt')


