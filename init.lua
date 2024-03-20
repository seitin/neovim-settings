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
  -- {
  --   "xiyaowong/coc-sumneko-lua",
  -- },
  -- {
  --   "neoclide/coc.nvim",
  --   branch = "release"
  -- },
  -- { "vim-airline/vim-airline" },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  { "catppuccin/nvim" },
  { 'Mofiqul/dracula.nvim' },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "nvim-lua/plenary.nvim" },
  -- { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  { 'mfussenegger/nvim-lint' },
  { 'stevearc/conform.nvim' },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  { "jremmen/vim-ripgrep" },
  -- { "nvim-treesitter/nvim-treesitter" },
  { "tpope/vim-commentary" },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   build = "cd app && npm install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  --   ft = { "markdown" },
  -- },
  -- { 'glepnir/nerdicons.nvim', cmd = 'NerdIcons', config = function() require('nerdicons').setup({}) end},
  -- { 'rmagatti/goto-preview'},
  { 'github/copilot.vim' },
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
  { 'f-person/git-blame.nvim' },
  { "neovim/nvim-lspconfig" },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  { "lukas-reineke/lsp-format.nvim" },
})

require('lorem').setup({
  sentenceLength = "mixedShort",
  comma = 0.1
})

-- require("coc-settings")
require("telescope-settings")
require("default-settings")
require("linting")
-- require("bufferline-settings")
require("nvimtree-settings")
require("git-settings")

-- let &t_ut=''
--

require("lsp-settings")
require("nvim-cmp")
require("noice-settings")
