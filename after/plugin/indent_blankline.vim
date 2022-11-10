" vim: ft=lua
lua <<EOF
require('indent_blankline').setup{
  enabled = false,
  char = '▏',
  char_list = {},
  use_treesitter = true,
  max_indent_increase = 1,
  show_first_indent_level = false,
  buftype_exclude = { 'terminal', 'help' }
}
EOF
