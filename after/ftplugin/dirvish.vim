silent! keeppatterns g@\v/\.[^\/]+/?$@d
silent! sort r /[^\/]$/
silent! call fugitive#detect(@%)
