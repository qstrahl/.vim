-- local transform_mod = require('telescope.actions.mt').transform_mod
local telescope = require('telescope')
local actions = require('telescope.actions')
-- local state = require('telescope.actions.state')

telescope.load_extension('scriptnames')

-- local custom_actions = transform_mod({
--   paste = function(prompt_bufnr)
--     local entry = state.get_selected_entry()
--     -- print(vim.inspect(entry))
--
--     local value
--
--     if type(entry) == 'table' then
--       if type(entry.text) == 'string' then
--         value = entry.text
--       elseif type(entry[1]) == 'string' then
--         value = entry[1]
--       end
--     elseif type(entry) == 'string' then
--       value = entry
--     end
--
--     if type(value) == 'string' then
--       -- vim.fn.setreg('"', value)
--       actions.close(prompt_bufnr)
--       vim.api.nvim_put({ value }, '', true, true)
--     end
--   end,
-- })

-- -- checks if the current search line is empty
-- local function line_empty ()
--   local line = state.get_current_line()
--   return string.len(line) == 0
-- end
--
-- -- closes telescope if line is empty, else enters normal mode
-- local function close_or_normal (prompt_bufnr)
--   if line_empty() then
--     actions.close(prompt_bufnr)
--   else
--     vim.cmd.stopinsert()
--   end
-- end

local toggle_selection_and_move_worse =
  actions.toggle_selection + actions.move_selection_worse

local toggle_selection_and_move_better =
  actions.toggle_selection + actions.move_selection_better

require('telescope').setup {
  defaults = {
    prompt_prefix = '',
    selection_caret = '  ',
    multi_icon = '➤ ',
    dynamic_preview_title = true,

    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      n = {
        ['<C-Space>'] = 'toggle_selection',
        ['<S-Space>'] = 'toggle_selection',
        ['<C-S-Space>'] = 'toggle_selection',
        ['<C-CR>'] = 'toggle_selection',
        ['<S-CR>'] = 'toggle_selection',
        ['<C-S-CR>'] = 'toggle_selection',
        ['<C-j>'] = 'move_selection_better',
        ['<C-k>'] = 'move_selection_worse',
        ['<M-j>'] = 'move_selection_better',
        ['<M-k>'] = 'move_selection_worse',
      },
      i = {
        -- Disable default mappings I don't like
        ['<C-u>'] = false,
        ['<C-x>'] = false,

        -- Add custom mappings
        ['<C-h>'] = 'which_key',
        ['<C-j>'] = 'move_selection_better',
        ['<C-k>'] = 'move_selection_worse',
        ['<M-j>'] = 'move_selection_better',
        ['<M-k>'] = 'move_selection_worse',
        ['<C-o>'] = 'select_horizontal',
        ['<C-s>'] = 'select_horizontal',
        ['<C-->'] = 'select_horizontal',
        ['<C-Bslash>'] = 'select_vertical',
        ['<C-d>'] = 'close',
        ['<C-.>'] = 'edit_command_line',
        ['<C-/>'] = 'edit_search_line',
        ['<C-Tab>'] = toggle_selection_and_move_worse,
        ['<C-S-Tab>'] = toggle_selection_and_move_better,
        ['<C-CR>'] = 'toggle_selection',
        -- ['<Esc>'] = close_or_normal,
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
