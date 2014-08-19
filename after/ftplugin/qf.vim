setl nowrap
setl nocuc nocul
setl conceallevel=2
setl concealcursor=nvic

function! s:defineSyntax()
    syn match qfFugitivePrefix ?^fugitive://.\{-}\.git//? containedin=qfFileName conceal cchar=⌥ nextgroup=qfFugitiveHash
    syn match qfFugitiveHash +[[:xdigit:]]*+ contained contains=qfFugitiveLongHash nextgroup=@qfFugitiveAfterHash
    syn match qfFugitiveLongHash /[[:xdigit:]]\{7}\zs[[:xdigit:]]*\ze/ contained conceal
    syn cluster qfFugitiveAfterHash contains=qfFugitiveSeparator,qfFugitiveFileName,qfLineNr
    syn match qfFugitiveSeparator +/+ contained conceal cchar=: nextgroup=qfFugitiveFileName
    syn match qfFugitiveFileName +[^/|][^|]*+ contained nextgroup=qfLineNr
    syn region qfLineNr matchgroup=Delimiter start=/|/ end=/|/ skip=/\\\(\\\\\)*/ contained contains=qfError
    syn match qfFileName /^[^|]*/ nextgroup=qfLineNr
    syn clear qfSeparator
endfunction

autocmd Syntax <buffer> call s:defineSyntax()

hi link qfFugitiveFileName qfFileName
hi link qfFugitiveSeparator Normal
hi link qfFugitiveHash Identifier
hi link qfLineNr Number
