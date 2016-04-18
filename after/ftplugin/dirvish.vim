silent! keeppatterns g@\v/\.[^\/]+/?$@d
silent! sort r /[^\/]$/
silent! call fugitive#detect(@%)
silent! call ProjectionistDetect(resolve(expand('%:p'))) 
