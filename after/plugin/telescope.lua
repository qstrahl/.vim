local transform_mod = require('telescope.actions.mt').transform_mod
local action_state = require('telescope.actions.state')
local action_set = require('telescope.actions')

local actions = transform_mod({
  paste = function(prompt_bufnr)
    local entry = action_state.get_selected_entry()
    -- print(vim.inspect(entry))

    local value

    if type(entry) == 'table' then
      if type(entry.text) == 'string' then
        value = entry.text
      elseif type(entry[1]) == 'string' then
        value = entry[1]
      end
    elseif type(entry) == 'string' then
      value = entry
    end

    if type(value) == 'string' then
      -- vim.fn.setreg('"', value)
      action_set.close(prompt_bufnr)
      vim.api.nvim_put({ value }, '', true, true)
    end
  end,
})

require('telescope').setup {
  defaults = {
    selection_caret = '  ',
    multi_icon = '➤ ',

    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- Disable default mappings I don't like
        ['<C-u>'] = false,
        ['<C-x>'] = false,

        -- Add custom mappings
        ['<C-h>'] = 'which_key',
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
        ['<C-o>'] = 'select_horizontal',
        ['<C-d>'] = 'close',
        ['<C-.>'] = 'edit_command_line',
        ['<C-/>'] = 'edit_search_line',
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
