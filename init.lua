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
  { 'mfussenegger/nvim-lint' },
  { "nvim-telescope/telescope.nvim" },
  -- { "junegunn/fzf.vim" },
  -- { "kien/ctrlp.vim" },
  { "jremmen/vim-ripgrep" },
  -- { "nvim-treesitter/nvim-treesitter" },
  { "tpope/vim-commentary" },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  { 'glepnir/nerdicons.nvim', cmd = 'NerdIcons', config = function() require('nerdicons').setup({}) end},
  { 'rmagatti/goto-preview'},
  { 'github/copilot.vim' },
})

-- NeoTree
vim.api.nvim_set_keymap("", "<C-n>", ":Neotree toggle<CR>", {noremap = true})

require("coc-settings")
-- require("ctrlp-settings")
require("telescope-settings")
require("default-settings")
require("bufferline-settings")
require("neotree-settings")
-- require("fzf-settings")
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
-- let &t_ut=''
