vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    -- Format on save safely without losing buffer content on error
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = vim.api.nvim_get_current_buf(),
      callback = function()
        local file_path = vim.api.nvim_buf_get_name(0)
        -- Run eslint_d and capture output
        local cmd = "eslint_d --stdin --stdin-filename " .. vim.fn.shellescape(file_path) .. " --fix-to-stdout"
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        local input = table.concat(lines, "\n")

        local result = vim.fn.system(cmd, input)

        -- Only update buffer if eslint_d succeeded (exit code 0) and returned code
        if vim.v.shell_error == 0 and result ~= "" then
          local new_lines = vim.split(result, "\n")
          -- Remove trailing empty string from split if necessary
          if new_lines[#new_lines] == "" then
            table.remove(new_lines)
          end
          vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
        end
      end,
    })
  end,
})

-- Formata o arquivo inteiro usando o formatador nativo definido em formatprg
vim.keymap.set("n", "<leader>f", "gggqG''", { desc = "Formatar arquivo com formatprg" })

local lua_format_grp = vim.api.nvim_create_augroup("LuaFormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.lua",
  group = lua_format_grp,
  callback = function()
    -- Pega o caminho completo do arquivo atual no buffer
    local file = vim.api.nvim_buf_get_name(0)

    -- Executa o stylua diretamente no arquivo de forma silenciosa
    vim.fn.system(string.format("stylua --search-parent-directories %s", vim.fn.shellescape(file)))

    -- Recarrega o buffer para mostrar o arquivo já formatado na tela
    vim.cmd("checktime")
  end,
})
