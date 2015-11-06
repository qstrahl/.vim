function! s:DoExpand()
    call UltiSnips#ExpandSnippet()
    return g:ulti_expand_res ? "" : s:expand_key
endfunction

function! s:DoExpandJump()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res ? "" : s:expand_jump_key
endfunction

function! s:DoJump()
    call UltiSnips#JumpForwards()
    return g:ulti_jump_forwards_res ? "" : s:jump_key
endfunction

function! s:DoJumpBack()
    call UltiSnips#JumpBackwards()
    return g:ulti_jump_backwards_res ? "" : s:jump_back_key
endfunction

function! s:Expand(key)
    let s:expand_key = a:key
    return "\<Plug>(SnipExpand)"
endfunction

function! s:ExpandJump(key)
    let s:expand_jump_key = a:key
    return "\<Plug>(SnipExpandJump)"
endfunction

function! s:Jump(key)
    let s:jump_key = a:key
    return "\<Plug>(SnipJump)"
endfunction

function! s:JumpBack(key)
    let s:jump_back_key = a:key
    return "\<Plug>(SnipJumpBack)"
endfunction

inoremap <silent> <Plug>(SnipExpand) <C-R>=<SID>DoExpand()<CR>
inoremap <silent> <Plug>(SnipExpandJump) <C-R>=<SID>DoExpandJump()<CR>
inoremap <silent> <Plug>(SnipJump) <C-R>=<SID>DoJump()<CR>
inoremap <silent> <Plug>(SnipJumpBack) <C-R>=<SID>DoJumpBack()<CR>

imap <expr> <CR> delimitMate#WithinEmptyPair() ? "\<Plug>delimitMateCR" : <SID>Expand("\<CR>")
imap <expr> <Tab> pumvisible() ? <SID>Jump("\<C-n>") : <SID>ExpandJump("\<Tab>")
imap <expr> <S-Tab> pumvisible() ? <SID>JumpBack("\<C-p>") : <SID>JumpBack("\<S-Tab>")

nnoremap <C-s> :<C-u>UltiSnipsEdit!<CR>
