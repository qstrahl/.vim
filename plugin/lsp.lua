require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    'bashls',
    'cssls',
    'elixirls',
    'eslint',
    'graphql',
    'html',
    'jsonls',
    'lua_ls',
    'marksman',
    'pyright',
    -- 'ruby_ls',
    'rust_analyzer',
    'sqlls',
    'tsserver',
    'vimls',
    'lemminx',
    'yamlls',
  }
}

-- neovim-specific lsp plugin!
require('neodev').setup()

local lspconfig = require('lspconfig')
local lspconfig_ui_windows = require('lspconfig.ui.windows')

local function extend (...)
  return vim.tbl_extend('force', ...)
end

-- Defines/clears an augroup and buflocal autocmds inside it
-- `group` is the name of the augroup
-- each additional argument is a pair: { event, callback }
local function set_autocmds(default_opts, ...)
  for _, autocmd in pairs({...}) do
    -- define locals; construct new opts table for nvim_create_autocmd
    local event, opts = nil, vim.deepcopy(default_opts)

    -- grab the event name and callback
    event, opts.callback = unpack(autocmd)

    -- create the autocmd
    vim.api.nvim_create_autocmd(event, opts)
  end
end

local function set_augroup_with_opts(group, clear, autocmd_opts, ...)
  local group_opts = { clear = clear }
  group = vim.api.nvim_create_augroup(group, group_opts)
  set_autocmds(extend({ group = group }, autocmd_opts), ...)
end

local function set_augroup(group, clear_group, ...)
  set_augroup_with_opts(group, clear_group, {}, ...)
end

-- Takes a callback intended for a keymap and makes it work like an operator
local function operator (callback)
  return function ()
    vim.lsp.opfunc = callback
    vim.o.opfunc = 'v:lua.vim.lsp.opfunc'
    return 'g@'
  end
end

-- helper for defining custom lsp functions involving lists of stuff
local function on_list (listOpts, callback)
  return {
    on_list = function(args)
      local list = args.items
      vim.ui.select(list, listOpts, callback)
    end
  }
end

-- custom lsp functions

local function list_workspace_folders ()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

local function document_symbol ()
  vim.lsp.buf.document_symbol()
end

local function workspace_symbol ()
  vim.lsp.buf.workspace_symbol('', on_list(
    {
      prompt = 'Select a Workspace Symbol:',
      format_item = function(item)
        return item.text
      end,
    },
    function (chosenItem)
      print(vim.inspect(chosenItem))
      -- TODO: something more useful
    end
  ))
end

local function lsp_format (motion)
  local buffer = vim.api.nvim_get_current_buf()
  local mode = ({ char = 'v', line = 'V', block = '<c-v>' })[motion]
  local range

  if mode then
    range = {
      vim.api.nvim_buf_get_mark(buffer, '['),
      vim.api.nvim_buf_get_mark(buffer, ']'),
    }
  elseif vim.api.nvim_get_mode()[1] ~= 'no' then
    range = {
      vim.api.nvim_buf_get_mark(buffer, '<'),
      vim.api.nvim_buf_get_mark(buffer, '>'),
    }
  else
    local linenr = unpack(vim.api.nvim_win_get_cursor(0))
    local count = vim.v.count

    if count == 1 then
      count = 0
    end

    local lastline = vim.api.nvim_buf_get_lines(buffer, linenr, linenr + count, false)[-2]
    local lastlinelen = string.len(lastline)

    range = {
      { linenr, 0 },
      { linenr + count, lastlinelen - 1 }
    }
  end

  -- print(vim.inspect(mode), vim.inspect(range))

  vim.lsp.buf.format {
    async = true,
    bufnr = buffer,
    range = range,
  }
end

-- styling lsp ui elements

local border = 'rounded'

lspconfig_ui_windows.default_options.border = border

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  -- Use a sharp border with `FloatBorder` highlights
  vim.lsp.handlers.hover, { border = border }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  -- Use a sharp border with `FloatBorder` highlights
  vim.lsp.handlers.signature_help, { border = border }
)

-- always-available maps
vim.keymap.set('n', '<Leader>do', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<Leader>dl', vim.diagnostic.setloclist)
vim.keymap.set('n', '<Leader>dq', vim.diagnostic.setqflist)

-- buffer-specfic configuration, happens on LSP attachment
local function on_lsp_attach (ev)
  local buffer = ev.buf
  local client = vim.lsp.get_client_by_id(ev.data.client_id)

  local keymap_opts = { buffer = buffer, noremap = true, silent = true }
  local operator_opts = extend(keymap_opts, { expr = true })

  -- Set buflocal autocmds all in the same group
  local function set_buf_augroup (group, ...)
    -- First, clear any pre-existing buflocal autocmds in this group
    vim.api.nvim_create_augroup(group, { clear = false })
    vim.api.nvim_clear_autocmds({ group = group, buffer = buffer })

    return set_augroup_with_opts(group, false, { buffer = buffer }, ...)
  end

  -- Set buflocal keymap
  local function set_buf_keymap (mode, keys, callback)
    vim.keymap.set(mode, keys, callback, keymap_opts)
  end

  -- Set buflocal operator keymap
  local function set_buf_operator (mode, keys, callback)
    vim.keymap.set(mode, keys, operator(callback), operator_opts)
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.bo[buffer].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- builtin lsp functions
  set_buf_keymap('n', 'gD',             vim.lsp.buf.declaration                 )
  set_buf_keymap('n', 'gd',             vim.lsp.buf.definition                  )
  set_buf_keymap('n', '<Leader>D',      vim.lsp.buf.type_definition             )
  set_buf_keymap('n', 'gI',             vim.lsp.buf.implementation              )
  set_buf_keymap('n', 'K',              vim.lsp.buf.hover                       )
  set_buf_keymap('n', '<C-k>',          vim.lsp.buf.signature_help              )
  set_buf_keymap('n', '<Leader>a',      vim.lsp.buf.code_action                 )
  set_buf_keymap('n', 'gr',             vim.lsp.buf.references                  )
  set_buf_keymap('n', '<Leader>n',      vim.lsp.buf.rename                      )
  set_buf_keymap('n', '<Leader>wa',     vim.lsp.buf.add_workspace_folder        )
  set_buf_keymap('n', '<Leader>wr',     vim.lsp.buf.remove_workspace_folder     )

  -- custom lsp functions
  set_buf_keymap('n', '<Leader>wl',        list_workspace_folders  )

  -- Set some keybinds conditional on server capabilities

  if client then
    -- highlight symbols in the document on CursorHold
    if client.server_capabilities.documentHighlightProvider then
      set_buf_augroup('UserLspDocumentHighlight',
        { 'CursorMoved',  vim.lsp.buf.clear_references    },
        { 'CursorMovedI', vim.lsp.buf.clear_references    },
        { 'BufLeave',     vim.lsp.buf.clear_references    },
        { 'CursorHold',   vim.lsp.buf.document_highlight  },
        { 'CursorHoldI',  vim.lsp.buf.document_highlight  },
        { 'BufEnter',     vim.lsp.buf.document_highlight  }
      )
    end
  end
end

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
set_augroup('UserLspConfig', true, { 'LspAttach', on_lsp_attach })

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local default_server_config = {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  flags = {
    debounce_text_changes = 150, -- This is the default in Nvim 0.7+
  }
}

-- server-specifc settings (note: `settings` is a child of `options`)
-- so far, no servers care about other `options` - only `settings`
local server_settings = {

  lua_ls = {
    Lua = {
      runtime = {
        version = 'Lua 5.1'
      },
      diagnostics = {
        -- this kills me a little bit... but until every vim plugin dev adds
        -- a proper .luarc.json file to their project root, I have no choice
        globals = { 'vim' }
      }
    }
  },

  yamlls = {
    yaml = {
      -- yeah, no.
      keyOrdering = false
    }
  }

}

local handlers = {
  -- default server handler
  function (server_name)
    lspconfig[server_name].setup(default_server_config)
  end
}

for key, settings in pairs(server_settings) do
  -- construct server-specific handlers from server_settings
  handlers[key] = function ()
    local config = extend(default_server_config, { settings = settings })
    lspconfig[key].setup(config)
  end
end

require("mason-lspconfig").setup_handlers(handlers)
