setl cms=<!--\ %s\ -->
setl fdm=syntax
setl fdt=getline(v:foldstart).'\ ...\ '.substitute(getline(v:foldend),'^\\s\\+','','')
setl fo-=a
setl fo-=t
if &ft != 'php'
    setl isk+=-
endif
