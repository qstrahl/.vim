require('nvim-treesitter.configs').setup {
  ensure_installed = 'all', -- one of 'all', or a list of languages
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
  ignore_install = { 'haskell' }, -- It's broken on mac

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      include_surrounding_whitespace = function (opts)
        -- Include surrounding whitespace for 'outer' objects
        if opts.query_string:find('%.outer$') then
          return true
        else
          return false
        end
      end,
      keymaps = {
        -- [''] = { query = '@assignment.inner', desc = '' },
        -- [''] = { query = '@assignment.lhs', desc = '' },
        -- [''] = { query = '@assignment.outer', desc = '' },
        -- [''] = { query = '@assignment.rhs', desc = '' },
        -- [''] = { query = '@attribute.inner', desc = '' },
        -- [''] = { query = '@attribute.outer', desc = '' },
        ['ib'] = { query = '@block.inner', desc = 'Select inner part of a block' },
        ['ab'] = { query = '@block.outer', desc = 'Select outer part of a block' },
        -- [''] = { query = '@call.inner', desc = '' },
        -- [''] = { query = '@call.outer', desc = '' },
        ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
        ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
        ['i/'] = { query = '@comment.inner', desc = 'Select inner part of a comment' },
        ['a/'] = { query = '@comment.outer', desc = 'Select outer part of a comment' },
        -- [''] = { query = '@conditional.inner', desc = '' },
        -- [''] = { query = '@conditional.outer', desc = '' },
        -- [''] = { query = '@frame.inner', desc = '' },
        -- [''] = { query = '@frame.outer', desc = '' },
        ['if'] = { query = '@function.inner', desc = 'Select inner part of a function' },
        ['af'] = { query = '@function.outer', desc = 'Select outer part of a function' },
        -- [''] = { query = '@loop.inner', desc = '' },
        -- [''] = { query = '@loop.outer', desc = '' },
        -- [''] = { query = '@number.inner', desc = '' },
        ['i,'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter' },
        ['a,'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter' },
        -- [''] = { query = '@regex.inner', desc = '' },
        -- [''] = { query = '@regex.outer', desc = '' },
        -- [''] = { query = '@return.inner', desc = '' },
        -- [''] = { query = '@return.outer', desc = '' },
        -- [''] = { query = '@scopename.inner', desc = '' },
        -- [''] = { query = '@statement.outer', desc = '' },
      },
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
    swap = {
      enable = true,
      swap_next = {
        ['],'] = '@parameter.inner',
      },
      swap_previous = {
        ['[,'] = '@parameter.inner',
      }
    },
    move = {
      enable = true,
      goto_next_start = {
      },
      goto_next_end = {
      },
      goto_previous_start = {
      },
      goto_previous_end = {
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
      },
      goto_previous = {
      }
    }
  }
}

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
