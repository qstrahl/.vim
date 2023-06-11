require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    'bashls',
    'cssls',
    'elixirls',
    'graphql',
    'html',
    'jsonls',
    'lua_ls',
    'marksman',
    'pyright',
    'ruby_ls',
    'rust_analyzer',
    'sqlls',
    'tsserver',
    'vimls',
    'lemminx',
    'yamlls',
  }
}

local lspconfig = require('lspconfig')
local lspconfig_ui_windows = require('lspconfig.ui.windows')

local border = 'rounded'

lspconfig_ui_windows.default_options.border = border

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    -- Use a sharp border with `FloatBorder` highlights
    border = border
  }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    -- Use a sharp border with `FloatBorder` highlights
    border = border
  }
)

vim.keymap.set('n', '<space>do', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>dl', vim.diagnostic.setloclist)
vim.keymap.set('n', '<space>dq', vim.diagnostic.setqflist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local buffer = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- Enable completion triggered by <c-x><c-o>

    vim.bo[buffer].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions

    local opts = { buffer = buffer, noremap = true, silent = true }
    local operatorOpts = vim.tbl_extend('force', opts, { expr = true })

    vim.keymap.set('n', 'gD',           vim.lsp.buf.declaration,                opts)
    vim.keymap.set('n', 'gd',           vim.lsp.buf.definition,                 opts)
    vim.keymap.set('n', '<space>D',     vim.lsp.buf.type_definition,            opts)
    vim.keymap.set('n', 'gI',           vim.lsp.buf.implementation,             opts)
    vim.keymap.set('n', 'K',            vim.lsp.buf.hover,                      opts)
    vim.keymap.set('n', '<C-k>',        vim.lsp.buf.signature_help,             opts)

    vim.keymap.set('n', '<space>a',     vim.lsp.buf.code_action,                opts)
    vim.keymap.set('n', 'gr',           vim.lsp.buf.references,                 opts)

    vim.keymap.set('n', '<space>rn',    vim.lsp.buf.rename,                     opts)
    vim.keymap.set('n', '<space>wa',    vim.lsp.buf.add_workspace_folder,       opts)
    vim.keymap.set('n', '<space>wr',    vim.lsp.buf.remove_workspace_folder,    opts)

    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    function OnList (listOpts, callback)
      return {
        on_list = function(args)
          local list = args.items
          vim.ui.select(list, listOpts, callback)
        end
      }
    end

    function DocumentSymbol ()
      vim.lsp.buf.document_symbol()
    end

    function WorkspaceSymbol ()
      vim.lsp.buf.workspace_symbol('', OnList(
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

    vim.keymap.set('n', '<Leader>s',    DocumentSymbol,         opts)
    vim.keymap.set('n', '<Leader>S',    WorkspaceSymbol,        opts)

    -- Set some keybinds conditional on server capabilities

    function Operator (callback)
      return function ()
        vim.lsp.opfunc = callback
        vim.o.opfunc = 'v:lua.vim.lsp.opfunc'
        return 'g@'
      end
    end

    function LspFormat (motion)
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
        local linenr = vim.api.nvim_win_get_cursor(0)
        local count = vim.v.count

        if count == 1 then
          count = 0
        end

        local lastline = vim.api.nvim_buf_get_lines(buffer, linenr, linenr + count)[-2]
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

    -- TODO: make this work properly
    if client.server_capabilities.documentRangeFormattingProvider then
      vim.keymap.set('n', 'gq', Operator(LspFormat), operatorOpts)
      vim.keymap.set('n', 'gqq', LspFormat, opts)
      vim.keymap.set('v', 'gq', LspFormat, opts)
    end

    if client.server_capabilities.documentHighlightProvider then
      local group = vim.api.nvim_create_augroup('UserLspDocumentHighlight', {})
      local groupOpts = { group = group, buffer = buffer}

      function AutocmdOpts (table)
        return vim.tbl_extend('force', groupOpts, table)
      end

      vim.api.nvim_create_autocmd('CursorHold', AutocmdOpts({
        callback = vim.lsp.buf.document_highlight
      }))

      vim.api.nvim_create_autocmd('CursorMoved', AutocmdOpts({
        callback = vim.lsp.buf.clear_references
      }))
    end
  end,
})

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local flags = {
  debounce_text_changes = 150, -- This is the default in Nvim 0.7+
}

local serverOpts = {
  capabilities = capabilities,
  flags = flags,
}

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    lspconfig[server_name].setup(serverOpts)
  end,

  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ['lua_ls'] = function ()
  --   lspconfig['lua_ls'].setup(vim.tbl_extend('force', serverOpts, {
  --     settings = {
  --       Lua = {
  --         diagnostics = {
  --           globals = { 'vim' }
  --         }
  --       }
  --     }
  --   }))
  -- end
}
