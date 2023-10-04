vim.cmd([[ :colorscheme catppuccin-frappe ]])
vim.cmd([[ let g:airline_theme = 'catppuccin' ]])
vim.cmd([[ set nocompatible              " be iMproved, required ]])
vim.cmd([[ filetype off                  " required ]])
vim.cmd([[ filetype plugin indent on    " required ]])
vim.cmd([[ set ignorecase ]])
vim.cmd([[ set smartcase ]])
vim.cmd([[ set clipboard=unnamed ]])

vim.cmd([[ nnoremap <C-h> <C-w>h ]])
vim.cmd([[ nnoremap <C-l> <C-w>l ]])
vim.cmd([[ nnoremap <C-j> <C-w>j ]])
vim.cmd([[ nnoremap <C-k> <C-w>k ]])
vim.cmd([[ :set tabstop=2 ]])
vim.cmd([[ :set softtabstop=2 ]])
vim.cmd([[ :set shiftwidth=2 ]])
vim.cmd([[ :set expandtab ]])
vim.cmd([[ :set relativenumber ]])
vim.cmd([[ :set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/**/*.*,*/venv/**,**/.git/**,**/lib/**,**/bin/**,**/etc/**,**/lib64/**,_next/** ]])

vim.api.nvim_set_keymap("", "<Tab>", "gt", {noremap = true})
vim.api.nvim_set_keymap("", "<S-Tab>", "gT", {noremap = true})
vim.api.nvim_set_keymap("", "<C-b>", "<cmd>set norelativenumber!<cr>", {noremap = true})