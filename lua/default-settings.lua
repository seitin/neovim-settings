-- vim.cmd([[ :colorscheme catppuccin-mocha ]])
-- vim.cmd([[ :colorscheme tokyonight-moon ]])
-- vim.cmd([[ :colorscheme dracula ]])
vim.cmd([[ :colorscheme nightfly ]])
-- Lua
require('lualine').setup {
  options = {
    theme = 'nightfly'
  }
}

vim.cmd([[ set wildmenu wildmode=longest:full ]])
vim.cmd([[ syntax enable ]])
vim.cmd([[ set conceallevel=2 ]])

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
vim.cmd(
  [[ :set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/**/*.*,*/venv/**,**/.git/**,**/lib/**,**/bin/**,**/etc/**,**/lib64/**,_next/** ]])
-- vim.cmd([[ :set loaded_perl_provider=0 ]])

vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
-- For Lua configuration (init.lua)
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- For Lua configuration (init.lua)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  end,
})

vim.keymap.set("n", "<leader>r", ":so ~/.config/nvim/lua/default-settings.lua<CR>", { noremap = true, silent = true })

require("rest-nvim").setup({
  result_split_horizontal = false,
  result_split_in_place = false,
  skip_ssl_verification = false,
  encode_url = true,
  highlight = {
    enabled = true,
    timeout = 150,
  },
  env_file = '.env'
})

vim.keymap.set("n", "<space>r", ":Rest run<CR>", { noremap = true, silent = true })

require("fzf-settings")

require("nvimtree-settings")
require("git-settings")
require("lsp-settings")
require("cursorline-settings")
require("treesiter-settings")

require("copilot")
require("mason.settings")
-- require("minuet-settings")
