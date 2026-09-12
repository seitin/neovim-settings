vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/rafamadriz/friendly-snippets",
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "lua_ls",
    "stylua",
    "ts_ls",
    "ruff",
    "pyright",
  },
})

require("luasnip.loaders.from_vscode").lazy_load()

-- vim.lsp.enable("lua_ls")
-- vim.lsp.enable("ts_ls")
-- vim.lsp.enable("pyright")
-- vim.lsp.enable("ruff")

local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup({
  signature = { enabled = true },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 250 },
    menu = {
      auto_show = true,
      draw = {
        treesitter = { "lsp" },
        columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
      },
    },
  },
})

vim.diagnostic.config({ virtual_text = true })

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show function signature description" })

vim.cmd([[ syntax enable ]])
vim.cmd([[ set conceallevel=2 ]])
vim.cmd([[ set wildmenu wildmode=longest:full ]])
vim.cmd([[ set nocompatible              " be iMproved, required ]])
vim.cmd([[ set ignorecase ]])
vim.cmd([[ set smartcase ]])
vim.cmd([[ set clipboard=unnamed ]])

vim.cmd([[ filetype off                  " required ]])
vim.cmd([[ filetype plugin indent on    " required ]])

vim.cmd([[ :set softtabstop=2 ]])
vim.cmd([[ :set shiftwidth=2 ]])
vim.cmd([[ :set expandtab ]])
vim.cmd([[ :set relativenumber ]])
vim.cmd(
  [[ :set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/**/*.*,*/venv/**,**/.git/**,**/lib/**,**/bin/**,**/etc/**,**/lib64/**,_next/** ]]
)
