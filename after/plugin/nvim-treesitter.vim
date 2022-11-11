set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", or a list of languages
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ignore_install = { "haskell" } -- It's broken on mac
}
EOF
