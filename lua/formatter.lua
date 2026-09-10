vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    -- Obtém o caminho completo do arquivo atual para o ESLint aplicar as regras locais corretamente
    local file_path = vim.api.nvim_buf_get_name(0)

    -- Configura o formatprg nativo para usar o ESLint via stdin
    vim.bo.formatprg = "npx eslint --stdin --stdin-filename " .. vim.fn.shellescape(file_path) .. " --fix-to-stdout"
  end,
})
-- Formata o arquivo inteiro usando o formatador nativo definido em formatprg
vim.keymap.set("n", "<leader>f", "gggqG''", { desc = "Formatar arquivo com formatprg" })
