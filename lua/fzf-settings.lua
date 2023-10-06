

vim.cmd([[ let g:fzf_vim = {} ]])
vim.cmd([[ let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/'] ]])

vim.cmd([[ let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/'] ]])

vim.cmd([[ let g:fzf_vim.preview_window = [] ]])

vim.keymap.set("n", "<C-p>", ":Files<cr>", { noremap = true })

--   let g:fzf_vim = {}
--   let g:fzf_vim.preview_bash = 'C:\Git\bin\bash.exe'
--   
