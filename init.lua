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
    "neoclide/coc.nvim",
    branch = "release"
  },
  { "vim-airline/vim-airline" },
  { "catppuccin/nvim" },
  { "nvim-lua/plenary.nvim" },
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  { 'mfussenegger/nvim-lint' },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  { "jremmen/vim-ripgrep" },
  { "tpope/vim-commentary" }
})

require("coc-settings")
require("telescope-settings")
require("default-settings")
require("bufferline-settings")
require("nvimtree-settings")

-- let &t_ut=''


