-- Lua
vim.g.mapleader = " "

vim.pack.add({ { src = "https://github.com/tpope/vim-commentary" } })

vim.keymap.set("n", "<space>q", ":bd<CR>", { noremap = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    (vim.hl or vim.highlight).on_yank({ timeout = 250 })
  end,
})
