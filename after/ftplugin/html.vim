if &ft != 'php'
    setl cms=<!--%s-->
    setl fdm=syntax
    setl fdt=getline(v:foldstart).'\ ...\ '.substitute(getline(v:foldend),'^\\s\\+','','')
    setl isk+=-
    setl tw=0
endif

"" Desperate attempt to get around eclim's zealous-as-fuck settings
autocmd BufEnter <buffer> setlocal omnifunc=
