-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    -- width = 50,
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
