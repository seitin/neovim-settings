vim.keymap.set("n", "<space>td", function() require("trouble").toggle("diagnostics") end)
vim.keymap.set("n", "gd", function() require("trouble").toggle("lsp_definitions") end)
vim.keymap.set("n", "gr", function() require("trouble").toggle("lsp_references") end)
vim.keymap.set("n", "gi", function() require("trouble").toggle("lsp_implementations") end)

