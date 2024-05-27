vim.cmd([[ :colorscheme catppuccin-mocha ]])
-- vim.cmd([[ :colorscheme tokyonight-moon ]])
-- vim.cmd([[ :colorscheme dracula ]])
-- vim.cmd([[ :colorscheme nightfly ]])
-- Lua
require('lualine').setup {
  options = {
    theme = 'nightfly'
  }
}

vim.cmd([[ set nocompatible              " be iMproved, required ]])
vim.cmd([[ filetype off                  " required ]])
vim.cmd([[ filetype plugin indent on    " required ]])
vim.cmd([[ set ignorecase ]])
vim.cmd([[ set smartcase ]])
vim.cmd([[ set clipboard=unnamed ]])

vim.keymap.set("n", "<space>q", ":bd<CR>", { noremap = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })

vim.cmd([[ :set softtabstop=2 ]])
vim.cmd([[ :set shiftwidth=2 ]])
vim.cmd([[ :set expandtab ]])
vim.cmd([[ :set relativenumber ]])
vim.cmd([[ :set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/**/*.*,*/venv/**,**/.git/**,**/lib/**,**/bin/**,**/etc/**,**/lib64/**,_next/** ]])


-- vim.cmd([[ set foldmethod=syntax ]])
-- vim.cmd([[ set foldlevel=99 ]])

-- require('lint').linters_by_ft = {
--   lua = {'luacheck',},
--   golang = { 'golangcilint', },
--   python = { 'pylint', },
--   javascript = { 'jshint', },
-- }
-- vim.api.nvim_create_autocmd({ "TextChanged" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })

