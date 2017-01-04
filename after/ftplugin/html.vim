if &ft != 'php'
    setl cms=<!--%s-->
    setl fdm=syntax
    " setl fdt=getline(v:foldstart).'\ ...\ '.substitute(getline(v:foldend),'^\\s\\+','','')
    setl isk+=-
    setl tw=0
endif
