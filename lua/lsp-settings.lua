vim.diagnostic.config({ virtual_text = true })
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.o.autocomplete = true
vim.o.complete = '.,w,b,o'
vim.o.completeopt = 'menuone,noselect,fuzzy'

vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('pyright')
