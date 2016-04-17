silent! keeppatterns g@\v/\.[^\/]+/?$@d
silent! sort r /[^\/]$/
if exists('*fugitive#detect') | call fugitive#detect(@%) | endif
