augroup MyCustomTreesitter
  autocmd!
  autocmd BufWrite *.scm lua require('nvim-treesitter.query').invalidate_query_cache()
augroup END
