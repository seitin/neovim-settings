local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'nvim-lua/plenary.nvim' },
  {
    "aserowy/tmux.nvim",
    config = function()
      return require("tmux").setup({
        copy_sync = {
          enable = true
        },
      })
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  { "catppuccin/nvim" },
  { "Mofiqul/dracula.nvim" },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "ibhagwan/fzf-lua",
  },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  { "jremmen/vim-ripgrep" },
  { "nvim-treesitter/nvim-treesitter" },
  { "tpope/vim-commentary" },
  { "yamatsum/nvim-cursorline" },
  -- { "lithammer/nvim-diagnosticls" },
  { "github/copilot.vim" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = false,         -- Enable debugging
      mappings = {
        complete = {
          detail = "Use @<Tab> or /<Tab> for options", -- Accept completion in normal mode
          insert = "<Tab>", -- Accept completion in insert mode
        },
      }
    },
  },
  { "f-person/git-blame.nvim" },
  { "neovim/nvim-lspconfig" },
  -- { "lukas-reineke/lsp-format.nvim" },
  -- { "klen/nvim-test" },
  -- { "tpope/vim-fugitive" },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      -- "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true
  },
  -- {
  --   "piersolenski/wtf.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --   },
  --   opts = {},
  --   keys = {
  --     {
  --       mode = { "n" },
  --       "gw",
  --       function()
  --         require("wtf").search()
  --       end,
  --       desc = "Search diagnostic with Google",
  --     },
  --   },
  -- },
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  --   -- stylua: ignore
  --   keys = {
  --     { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
  --     { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
  --     { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
  --     { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --     { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  --   },
  -- },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    },
  },
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
    },
  },
  -- { "hrsh7th/vim-vsnip" },
  -- { "hrsh7th/vim-vsnip-integ" },
  -- Mason core
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },

  -- Mason LSP integration
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },

  -- Mason tool installer (for linters/formatters)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },
  {
    'milanglacier/minuet-ai.nvim',
    config = function()
      require('minuet').setup {
        -- Your configuration options here
      }
    end,
  },
})

require("default-settings")
require("esp-idf-settings")

vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<Tab>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<CR>', { desc = 'Recarregar configuração' })
