vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig" } })

vim.diagnostic.config({ virtual_text = true })
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP Go to Definition' })

vim.o.autocomplete = true
vim.o.complete = '.,w,b,o'
vim.o.completeopt = 'menuone,noselect,fuzzy'

vim.cmd([[ syntax enable ]])
vim.cmd([[ set conceallevel=2 ]])
vim.cmd([[ set wildmenu wildmode=longest:full ]])
vim.cmd([[ set nocompatible              " be iMproved, required ]])
vim.cmd([[ set ignorecase ]])
vim.cmd([[ set smartcase ]])
vim.cmd([[ set clipboard=unnamed ]])

vim.cmd([[ filetype off                  " required ]])
vim.cmd([[ filetype plugin indent on    " required ]])

vim.cmd([[ :set softtabstop=2 ]])
vim.cmd([[ :set shiftwidth=2 ]])
vim.cmd([[ :set expandtab ]])
vim.cmd([[ :set relativenumber ]])
vim.cmd(
  [[ :set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/**/*.*,*/venv/**,**/.git/**,**/lib/**,**/bin/**,**/etc/**,**/lib64/**,_next/** ]])

vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('pyright')
