require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Mason LSP config
require("mason-lspconfig").setup({
  -- Automatically install these servers
  ensure_installed = {
    "vimls",           -- Vim
    "sqlls",           -- SQL
    "astro",           -- Astro
    "dockerls",        -- Docker
    "pyright",         -- Python
    "ts_ls",           -- TypeScript/JavaScript
    "svelte",          -- Svelte
    "gopls",           -- Go
    "html",            -- HTML
    "eslint",          -- ESLint
    "rust_analyzer",   -- Rust
    "lua_ls",          -- Lua
    "jsonls",          -- JSON
    "bashls",          -- Bash
  },
  
  -- Automatically install configured servers (with lspconfig)
  automatic_installation = true,
})

-- Mason tool installer for additional tools
require("mason-tool-installer").setup({
  ensure_installed = {
    -- Linters
    "hlint",           -- Haskell
    "jshint",          -- JavaScript
    "luacheck",        -- Lua
    "selene",          -- Lua
    "markdownlint",    -- Markdown
    "flake8",          -- Python
    "mypy",            -- Python
    "stylelint",       -- SCSS/CSS
    "shellcheck",      -- Shell
    "vint",            -- Vim
    "yamllint",        -- YAML
    
    -- Formatters
    "fish",            -- Fish shell formatter
    "prettier",        -- JS/TS/JSON formatter
    "stylua",          -- Lua formatter
    "isort",           -- Python import sorter
    "black",           -- Python formatter
    "shfmt",           -- Shell formatter
    "pg_format",       -- SQL formatter
  },
  
  -- Auto-update installed tools
  auto_update = false,
  
  -- Run on start
  run_on_start = true,
})

