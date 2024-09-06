vim.keymap.set("n", "<space>td", function() require("trouble").toggle("diagnostics") end)
vim.keymap.set("n", "<space>gr", function() require("trouble").toggle("lsp_references") end)
vim.keymap.set("n", "<space>gi", function() require("trouble").toggle("lsp_implementations") end)

