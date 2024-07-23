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
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  { "catppuccin/nvim" },
  { "Mofiqul/dracula.nvim" },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "nvim-lua/plenary.nvim" },
  { "mfussenegger/nvim-lint" },
  { "ibhagwan/fzf-lua",               build = "./install --bin" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  { "jremmen/vim-ripgrep" },
  { "nvim-treesitter/nvim-treesitter" },
  { "tpope/vim-commentary" },
  { "yamatsum/nvim-cursorline" },
  { "lithammer/nvim-diagnosticls" },
  { "github/copilot.vim" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  { "derektata/lorem.nvim" },
  { "f-person/git-blame.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "lukas-reineke/lsp-format.nvim" },
  { "edluffy/hologram.nvim" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    },
  },
  { "klen/nvim-test" },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      -- "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true
  },
  { 'RaafatTurki/corn.nvim' },
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {},
    keys = {
      {
        mode = { "n" },
        "gw",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
    },
  },
  { 'ggandor/leap.nvim' },
})

require("fzf-settings")

require("lorem").setup({
  sentenceLength = "mixedShort",
  comma = 0.1
})

require("default-settings")
require("nvimtree-settings")
require("git-settings")
require("lsp-settings")
require("nvim-cmp")
require("trouble-settings")
require("cursorline-settings")
require("treesiter-settings")
require("nvim-test-settings")

require("corn").setup()
require("cursorline-settings")
require("lualine-settings")
require("leap-settings")
