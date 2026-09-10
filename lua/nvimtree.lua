vim.pack.add({ { src = "https://github.com/nvim-tree/nvim-tree.lua" } })
vim.pack.add({ { src = "https://github.com/nvim-tree/nvim-web-devicons" } })
-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    -- width = 50,
    side = "right",
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})
