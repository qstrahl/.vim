"" vim: ft=lua
lua << EOF
require('lspfuzzy').setup {
  methods = {
    'textDocument/documentSymbol',
    'workspace/symbol',
  }
}
EOF
