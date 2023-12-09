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

-- from https://github.com/Wansmer/nvim-config/blob/main/lua/modules/foldtext.lua
local function parse_line(linenr)
  local bufnr = vim.api.nvim_get_current_buf()

  local line = vim.api.nvim_buf_get_lines(bufnr, linenr - 1, linenr, false)[1]
  if not line then
    return nil
  end

  local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
  if not ok then
    return nil
  end

  local query = vim.treesitter.query.get(parser:lang(), 'highlights')
  if not query then
    return nil
  end

  local tree = parser:parse({ linenr - 1, linenr })[1]

  local result = {}

  local line_pos = 0

  for id, node, metadata in query:iter_captures(tree:root(), 0, linenr - 1, linenr) do
    local name = query.captures[id]
    local start_row, start_col, end_row, end_col = node:range()

    local priority = tonumber(metadata.priority or vim.highlight.priorities.treesitter)

    if start_row == linenr - 1 and end_row == linenr - 1 then
      -- check for characters ignored by treesitter
      if start_col > line_pos then
        table.insert(result, {
          line:sub(line_pos + 1, start_col),
          { { 'Folded', priority } },
          range = { line_pos, start_col },
        })
      end
      line_pos = end_col

      local text = line:sub(start_col + 1, end_col)
      table.insert(result, { text, { { '@' .. name, priority } }, range = { start_col, end_col } })
    end
  end

  local i = 1
  while i <= #result do
    -- find first capture that is not in current range and apply highlights on the way
    local j = i + 1
    while j <= #result and result[j].range[1] >= result[i].range[1] and result[j].range[2] <= result[i].range[2] do
      for k, v in ipairs(result[i][2]) do
        if not vim.tbl_contains(result[j][2], v) then
          table.insert(result[j][2], k, v)
        end
      end
      j = j + 1
    end

    -- remove the parent capture if it is split into children
    if j > i + 1 then
      table.remove(result, i)
    else
      -- highlights need to be sorted by priority, on equal prio, the deeper nested capture (earlier
      -- in list) should be considered higher prio
      if #result[i][2] > 1 then
        table.sort(result[i][2], function(a, b)
          return a[2] < b[2]
        end)
      end

      result[i][2] = vim.tbl_map(function(tbl)
        return tbl[1]
      end, result[i][2])
      result[i] = { result[i][1], result[i][2] }

      i = i + 1
    end
  end

  return result
end

function HighlightedFoldtext()
  local result = parse_line(vim.v.foldstart)
  if not result then
    return vim.fn.foldtext()
  end

  local folded = {
    { '\u{2590}', 'FoldedIcon' },
    { '\u{f0278} ' .. vim.v.foldend - vim.v.foldstart, 'FoldedText' },
    { '\u{258c}', 'FoldedIcon' },
  }

  for _, item in ipairs(folded) do
    table.insert(result, item)
  end

  if not vim.wo.diff then
    local result2 = parse_line(vim.v.foldend)
    if result2 then
      local first = result2[1]
      local highlight = first[2][1]

      -- remove surrounding commentstrings from comments for maximum ~aesthetic~
      if highlight == '@comment' then
        -- escape the comment string...
        local commentstring = vim.bo.commentstring:gsub('(%W)', '%%%1')
        -- inject non-escaped match pattern into the comment string...
        commentstring = commentstring:gsub('%%%%s', '%s*(%.*)%s*')
        -- magic away the comment string!
        first[1] = first[1]:gsub(commentstring, '%1')
      end

      result2[1] = { vim.trim(first[1]), first[2] }

      for _, item in ipairs(result2) do
        table.insert(result, item)
      end
    end
  end

  return result
end

vim.g.HighlightedFoldtext = HighlightedFoldtext

vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = 'HighlightedFoldtext()'
