require('nvim-treesitter-textobjects').setup {
  select = {
    lookahead = true,
    include_surrounding_whitespace = function (opts)
      -- Include surrounding whitespace for 'outer' objects
      if opts.query_string:find('%.outer$') then
        return true
      else
        return false
      end
    end,
    selection_modes = {
      ['@assignment.inner'] = 'v',
      ['@assignment.lhs'] = 'v',
      ['@assignment.outer'] = 'v',
      ['@assignment.rhs'] = 'v',
      ['@attribute.inner'] = 'v',
      ['@attribute.outer'] = 'v',
      ['@block.inner'] = 'v',
      ['@block.outer'] = 'v',
      ['@call.inner'] = 'v',
      ['@call.outer'] = 'v',
      ['@class.inner'] = 'v',
      ['@class.outer'] = 'v',
      ['@comment.inner'] = 'v',
      ['@comment.outer'] = 'v',
      ['@conditional.inner'] = 'v',
      ['@conditional.outer'] = 'v',
      ['@frame.inner'] = 'v',
      ['@frame.outer'] = 'v',
      ['@function.inner'] = 'v',
      ['@function.outer'] = 'v',
      ['@loop.inner'] = 'v',
      ['@loop.outer'] = 'v',
      ['@number.inner'] = 'v',
      ['@parameter.inner'] = 'v',
      ['@parameter.outer'] = 'v',
      ['@regex.inner'] = 'v',
      ['@regex.outer'] = 'v',
      ['@return.inner'] = 'v',
      ['@return.outer'] = 'v',
      ['@scopename.inner'] = 'v',
      ['@statement.outer'] = 'v',
    },
  },
}

local select = require('nvim-treesitter-textobjects.select')
local swap = require('nvim-treesitter-textobjects.swap')

for map, textobj in pairs({
  ['ib'] = '@block.inner',
  ['ab'] = '@block.outer',
  ['ic'] = '@class.inner',
  ['ac'] = '@class.outer',
  ['i/'] = '@comment.inner',
  ['a/'] = '@comment.outer',
  ['if'] = '@function.inner',
  ['af'] = '@function.outer',
  ['i,'] = '@parameter.inner',
  ['a,'] = '@parameter.outer',
}) do
  vim.keymap.set({ 'x', 'o' }, map, function()
    select.select_textobject(textobj)
  end)
end

vim.keymap.set('n', '],', function()
  swap.swap_next('@parameter.inner')
end)
vim.keymap.set('n', '[,', function()
  swap.swap_previous('@parameter.inner')
end)
