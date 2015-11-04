function! s:ExpandOrJump(key)
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res ? '' : a:key
endfunction

function! s:JumpBackwards(key)
    call UltiSnips#JumpBackwards()
    return g:ulti_jump_backwards_res ? '' : a:key
endfunction

inoremap <silent> <Tab> <C-R>=<SID>ExpandOrJump("\<lt>Tab>")<CR>
inoremap <silent> <S-Tab> <C-R>=<SID>ExpandOrJump("\<lt>S-Tab>")<CR>
inoremap <silent> <C-o> <C-R>=<SID>ExpandOrJump("\<lt>C-o>")<CR>
nnoremap <C-s> :<C-u>tab sp +UltiSnipsEdit!<CR>
