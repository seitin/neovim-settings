-- Lua
vim.g.mapleader = " "

vim.pack.add({ { src = "https://github.com/tpope/vim-commentary" } })

vim.keymap.set("n", "<space>q", ":bd<CR>", { noremap = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })

