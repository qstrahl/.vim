require('pretty-fold').setup {
  fill_char = ' ',

  sections = {
    left = { 'content' },
    right = { ' ', 'number_of_folded_lines', ' ', }
  },
}
