-- Setup language servers.
local lspconfig = require('lspconfig')
-- vimls
lspconfig.vimls.setup {}
-- sqlls
lspconfig.sqlls.setup {}
-- dockerls
lspconfig.dockerls.setup {}
-- pyright
lspconfig.pyright.setup {}
-- typescript / javascript ls
lspconfig.ts_ls.setup {}
lspconfig.svelte.setup {}
-- golps
lspconfig.gopls.setup {}
-- svelt
lspconfig.svelte.setup {}
-- kulala
lspconfig.kulala_ls.setup {}
-- html
lspconfig.html.setup {}
-- eslint
lspconfig.eslint.setup({
  --- ...
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
-- rustls
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {},
  },
}
-- luals
lspconfig.lua_ls.setup {}
-- jsonls
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.jsonls.setup {
  capabilities = capabilities,
}

-- bashls
lspconfig.bashls.setup {}

-- diagnosticls
local diagnosticls = require("diagnosticls")
lspconfig.diagnosticls.setup({
  filetypes = {
    "haskell",
    unpack(diagnosticls.filetypes),
  },
  init_options = {
    linters = vim.tbl_deep_extend("force", diagnosticls.linters, {
      hlint = {
        command = "hlint",
        -- ...
      },
    }),
    formatters = diagnosticls.formatters,
    filetypes = {
      haskell = "hlint",
      javascript = "jshint",
      javascriptreact = "jshint",
      typescript = "jshint",
      typescriptreact = "jshint",
      lua = { "luacheck", "selene" },
      markdown = { "markdownlint" },
      python = { "flake8", "mypy" },
      scss = "stylelint",
      sh = "shellcheck",
      vim = "vint",
      yaml = "yamllint",
    },
    formatFiletypes = {
      fish = "fish_indent",
      javascript = "prettier",
      javascriptreact = "prettier",
      json = "prettier",
      lua = { "lua-format", "stylua" },
      python = { "isort", "black", "autoflake" },
      sh = "shfmt",
      sql = "pg_format",
      typescript = "prettier",
      typescriptreact = "prettier",
    },
  },
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    -- vim.keymap.set('n', 'gD', ':vsplit | lua vim.lsp.buf.definition()<CR>')
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
