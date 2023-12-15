require('oil').setup {
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  keymaps = {
    ['<C-->'] = 'actions.select_split',
    ['<C-\\>'] = 'actions.select_vsplit',
    ['<C-CR>'] = 'actions.select_tab',
    ['_'] = false,
  },
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name)
      return name == '..'
    end,
  },
  win_options = {
    cursorline = true,
  }
}
