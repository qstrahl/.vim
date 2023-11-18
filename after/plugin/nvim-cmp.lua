-- Set up nvim-cmp.
local cmp = require('cmp')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    documentation = cmp.config.window.bordered({
      winhighlight = 'Normal:Normal,Search:None',
      border = 'rounded',
      scrollbar = false,
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),

    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = 'buffer' },
--   })
-- })

-- I just... I can't believe I have to write this function
local function noop(fallback)
  fallback()
end

-- This one is more forgivable. I like this one
local function if_visible(callback, fallback)
  return function()
    if cmp.visible() then callback() else fallback() end
  end
end

local cmdline_map_overrides = {
  ['<C-j>'] = { c = if_visible(cmp.select_next_item, cmp.complete) },
  ['<C-k>'] = { c = if_visible(cmp.select_prev_item, cmp.complete) },
  ['<C-n>'] = { c = noop },
  ['<C-p>'] = { c = noop },
  ['<C-i>'] = { c = noop },
  ['<C-o>'] = { c = noop },
}

-- TODO: Look into passing optional args to cmp.complete
-- may be able to switch sources to only command line history when appropriate

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(cmdline_map_overrides),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(cmdline_map_overrides),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
