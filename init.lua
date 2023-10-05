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
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "neoclide/coc.nvim",
    branch = "release"
  },
  { "vim-airline/vim-airline" },
  { "catppuccin/nvim" },
  { "nvim-lua/plenary.nvim" },
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  -- { "nvim-telescope/telescope.nvim" },
  { "scrooloose/nerdtree" },
  { "kien/ctrlp.vim" },
  { "jremmen/vim-ripgrep" },
  { "nvim-treesitter/nvim-treesitter" },
  { "tpope/vim-commentary" }
})

-- NeoTree
vim.api.nvim_set_keymap("", "<C-n>", ":Neotree toggle<CR>", {noremap = true})

require("coc-settings")
require("ctrlp-settings")
-- require("telescope-settings")
require("default-settings")
require("bufferline-settings")

-- let &t_ut=''


