vim.lsp.enable({ 'lua_ls', 'vimls', 'sqlls', 'astro', 'dockerls', 'pyright', 'ts_ls', 'svelte', 'gopls', 'kulala_ls',
  'html', 'eslint', 'rust_analyzer', 'jsonls', 'bashls', 'diagnosticls', 'tailwindcss' })

vim.filetype.add({
  extension = {
    astro = "astro",
    mdx = "mdx",
  },
})

-- Common root directory patterns
local common_roots = {
  git = { '.git' },
  package = { 'package.json', '.git' },
  typescript = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
  eslint = { '.eslintrc', '.eslintrc.js', '.eslintrc.json', 'package.json', '.git' },
}

local lsp_configs = {
  vimls = {
    cmd = { 'vim-language-server', '--stdio' },
    filetypes = { 'vim' },
    root_dir = common_roots.git,
  },
  sqlls = {
    cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
    filetypes = { 'sql' },
    root_dir = common_roots.git,
  },
  astro = {
    cmd = { 'astro-ls', '--stdio' },
    filetypes = { 'astro' },
    root_dir = { 'package.json', 'tsconfig.json', 'astro.config.mjs', '.git' },
  },
  dockerls = {
    cmd = { 'docker-langserver', '--stdio' },
    filetypes = { 'dockerfile' },
    root_dir = common_roots.git,
  },
  pyright = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_dir = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
  },
  ts_ls = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_dir = common_roots.typescript,
  },
  svelte = {
    cmd = { 'svelteserver', '--stdio' },
    filetypes = { 'svelte' },
    root_dir = { 'package.json', 'svelte.config.js', '.git' },
  },
  gopls = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod' },
    root_dir = { 'go.work', 'go.mod', '.git' },
  },
  kulala_ls = {
    cmd = { 'kulala-ls', '--stdio' },
    filetypes = { 'http' },
    root_dir = common_roots.git,
  },
  html = {
    cmd = { 'vscode-html-language-server', '--stdio' },
    filetypes = { 'html' },
    root_dir = common_roots.package,
  },
  eslint = {
    cmd = { 'vscode-eslint-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_dir = common_roots.eslint,
  },
  rust_analyzer = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_dir = { 'Cargo.toml', 'rust-project.json', '.git' },
  },
  lua_ls = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_dir = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml',
      'selene.yml', '.git' },
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  jsonls = {
    cmd = { 'vscode-json-language-server', '--stdio' },
    filetypes = { 'json', 'jsonc' },
    root_dir = common_roots.package,
  },
  bashls = {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'sh', 'bash' },
    root_dir = common_roots.git,
  },
}

-- Configure all LSP servers
for server_name, config in pairs(lsp_configs) do
  vim.lsp.config(server_name, {
    cmd = config.cmd,
    filetypes = config.filetypes,
    root_dir = vim.fs.root(0, config.root_dir),
    settings = config.settings,
  })
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'astro', 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
  callback = function(args)
    local root_dir = vim.fs.root(args.buf,
      { 'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts', 'postcss.config.js',
        'package.json' })

    if not root_dir then
      return
    end

    vim.lsp.start({
      name = 'tailwindcss',
      cmd = { 'tailwindcss-language-server', '--stdio' },
      root_dir = root_dir,
      init_options = {
        userLanguages = {
          astro = "html",
        },
      },
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              { "cva\\(([^)]*)\\)",         "[\"'`]([^\"'`]*).*?[\"'`]" },
              { "cx\\(([^)]*)\\)",          "(?:'|\"|`)([^']*)(?:'|\"|`)" },
              { "class:list=\\{([^}]*)\\}", "[\"'`]([^\"'`]*).*?[\"'`]" },
            },
          },
          validate = true,
          classAttributes = { "class", "className", "classList", "ngClass", "class:list" },
          lint = {
            cssConflict = "warning",
            invalidApply = "error",
            invalidConfigPath = "error",
            invalidScreen = "error",
            invalidTailwindDirective = "error",
            invalidVariant = "error",
            recommendedVariantOrder = "warning",
          },
        },
      },
    })
  end,
})


vim.lsp.config('diagnosticls', {
  cmd = { 'diagnostic-languageserver', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'markdown', 'python', 'scss', 'sh', 'vim', 'yaml', 'haskell' },
  root_dir = vim.fs.root(0, common_roots.git),
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Open diagnostic message" })
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local client_id = ev.data.client_id
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(client_id)
    if not client then
      return
    end

    if client.server_capabilities.completionProvider and client.name ~= 'minuet' then
      vim.lsp.completion.enable(true, client_id, bufnr, { autotrigger = true })
    end


    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
      vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover,
      vim.tbl_extend('force', opts, { desc = 'Show documentation' }))
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
      vim.tbl_extend('force', opts, { desc = 'Show help signature' }))
    vim.keymap.set('n', '<space>i', vim.lsp.buf.implementation,
      vim.tbl_extend('force', opts, { desc = 'Show implementations' }))
    vim.keymap.set('n', '<space>d', vim.lsp.buf.type_definition,
      vim.tbl_extend('force', opts, { desc = 'Type definition' }))
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename' }))
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, vim.tbl_extend('force', opts, { desc = 'Format current buffer' }))
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
})
