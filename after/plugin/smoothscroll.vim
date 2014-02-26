function! s:SmoothVertScroll (direction, lines)
    let l:count = 0
    let l:lines = a:lines < 0 ? winheight(0) * float2nr(abs(a:lines)) / 100 : a:lines
    let l:key = a:direction == 1 ? "\<C-E>" : "\<C-Y>"
    let l:lazyredraw = &lazyredraw
    let l:map = l:lazyredraw ? ":\<C-U>echo | set nolazyredraw\<CR>" : ""
    while l:count < l:lines
        let l:map .= l:key
        let l:count += 1
    endwhile
    let l:map .= l:lazyredraw ? ":\<C-U>set lazyredraw | echo\<CR>" : ""
    return l:map
endfunction

noremap <silent> <Plug>SmoothVertScrollDown50Percent @=<SID>SmoothVertScroll(1, -50)<CR>
noremap <silent> <Plug>SmoothVertScrollUp50Percent @=<SID>SmoothVertScroll(-1, -50)<CR>

map <silent> <C-D> <Plug>SmoothVertScrollDown50Percent
map <silent> <C-U> <Plug>SmoothVertScrollUp50Percent
