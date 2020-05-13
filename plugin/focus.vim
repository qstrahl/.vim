" hi! ActiveNormal        cterm=italic    ctermfg=8       ctermbg=none
" hi! ActiveNormalNC      cterm=italic    ctermfg=8       ctermbg=none
" hi! ActiveDiffAdd       cterm=none      ctermfg=2       ctermbg=none
" hi! ActiveDiffChange    cterm=none      ctermfg=8       ctermbg=none
" hi! ActiveDiffDelete    cterm=none      ctermfg=0       ctermbg=none
" hi! ActiveDiffText      cterm=none      ctermfg=5       ctermbg=none

" let s:attrs = [ 'name', 'font', 'fg', 'bg', 'sp', 'fg#', 'bg#', 'sp#' ]
" let s:flags = [ 'bold', 'italic', 'reverse', 'inverse', 'standout', 'underline', 'undercurl' ]

" let s:mode = has('gui_running') || &termguicolors
"         \ ? 'gui'
"         \ : &t_Co >= 8
"           \ ? 'cterm'
"           \ : 'term'

" let s:prefix = 'muted_'
" let s:ignore = '\slinks to\|^' . s:prefix . '\|\scleared\|^Normal'
" let s:has_fg_or_bg = s:mode . '[fb]g=\S\+'
" let s:fg_pattern = s:mode . 'fg=\zs\S\+\ze'
" let s:bg_pattern = s:mode . 'bg=\zs\S\+\ze'

" let s:winhighlight = ''

" function! s:define_muted_highlights ()
"   let l:NormalNC = synIDtrans(hlID('NormalNC'))
"   let l:fg = synIDattr(l:NormalNC, 'fg')
"   let l:bg = synIDattr(l:NormalNC, 'bg')
"   let l:fg = empty(l:fg) ? 'none' : l:fg
"   let l:bg = empty(l:bg) ? 'none' : l:bg

"   let s:winhighlight = []

"   let l:hlentries = split(execute('highlight'), "\n")
"   for l:hlentry in l:hlentries
"     if l:hlentry !~# s:ignore && l:hlentry =~# s:has_fg_or_bg
"       let l:name = matchstr(l:hlentry, '^\w*')
"       let l:hlentry = substitute(l:hlentry, ' xxx ', ' ', '')
"       let l:hlentry .= ' ' . s:mode . 'fg=' . l:fg
"       let l:hlentry .= ' ' . s:mode . 'bg=' . l:bg
"       exe 'highlight!' s:prefix . l:hlentry
"       let s:winhighlight += [l:name . ':' . s:prefix . l:name]
"     endif
"   endfor

"   let s:winhighlight = join(s:winhighlight, ',')
" endfunction

" function! s:set_winhighlight ()
"   let l:current_winnr = winnr()
"   let l:diffing = getwinvar(l:current_winnr, '&diff')

"   for l:winnr in range(1, winnr('$'))
"     let l:empty_buftype = empty(getbufvar(winbufnr(l:winnr), '&buftype'))
"     let l:active_diff = l:diffing && getwinvar(l:winnr, '&diff')
"     let l:winhighlight = l:empty_buftype && ! l:active_diff ? s:winhighlight : ''

"     call setwinvar(l:winnr, '&winhighlight', l:winhighlight)
"   endfor
" endfunction

" autocmd! Syntax,ColorScheme * call s:define_muted_highlights()
" autocmd! BufEnter,BufWinEnter,BufWinLeave,WinEnter * call s:set_winhighlight()
" autocmd! OptionSet diff call s:set_winhighlight()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function! s:toggle_syntax ()
"   let l:winnr = winnr()
"   let l:winnrs = range(1, winnr('$'))
"   call filter(l:winnrs, {k, v -> v != l:winnr})

"   if len(l:winnrs)
"     let l:view = winsaveview()
"     let l:winrestcmd = winrestcmd()
"     let l:diff = &diff

"     for l:nr in l:winnrs
"       exe l:nr 'windo ToggleOwnSyntax' l:diff ? '&diff' : '0'
"     endfor

"     exe l:winnr 'wincmd w'
"     call winrestview(l:view)
"     exe l:winrestcmd
"   endif
" endfunction

" command! -nargs=1 ToggleOwnSyntax exe 'ownsyntax' <args> ? '' : '0'

" autocmd! WinEnter * call s:toggle_syntax() | ownsyntax
