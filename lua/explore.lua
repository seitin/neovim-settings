vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_browse_split = 4

-- 2. Toggle Sidebar on the Right Function
local function toggle_netrw_right()
  if vim.bo.filetype == "netrw" then
    vim.cmd("bwipeout")
  else
    -- Opens Lexplore, then forces the window to move to the far right
    vim.cmd("Lexplore")
    vim.cmd("wincmd L")
  end
end

-- 4. Netrw-Specific Fixes (Autocommands)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.keymap.set("n", "v", "v", { remap = true, buffer = true })
    vim.keymap.set("n", "l", "<CR>", { remap = true, buffer = true })
    vim.keymap.set("n", "<tab>", "<CR>", { remap = true, buffer = true })
    vim.keymap.set("n", "a", "%", { remap = true, buffer = true, desc = "Create new file" })
    vim.keymap.set("n", "r", "R", { remap = true, buffer = true, desc = "Rename file" })

    vim.keymap.set("n", "d", "D", { remap = true, buffer = true, desc = "Delete file" })

    vim.keymap.set("n", "H", "gh", { remap = true, buffer = true, desc = "Toggle hidden files" })
    vim.keymap.set("n", "P", "p", { remap = true, buffer = true, desc = "Preview file" })
    vim.keymap.set("n", "q", ":bwipeout<CR>", { silent = true, buffer = true, desc = "Close Netrw" })
    vim.keymap.set("n", "<Esc>", ":bwipeout<CR>", { silent = true, buffer = true, desc = "Close Netrw" })

    vim.keymap.set("n", "c", function()
      -- Pede o nome da pasta para o usuário
      local dir_name = vim.fn.input("Nome da nova pasta: ")
      if dir_name == "" then
        return
      end -- Cancela se o usuário der Esc/vazio

      -- Pega o diretório atual onde o Netrw está navegando
      local current_dir = vim.b.netrw_curdir
      local full_path = current_dir .. "/" .. dir_name

      -- Cria a pasta nativamente no sistema (o 'p' permite criar subpastas se necessário)
      vim.fn.mkdir(full_path, "p")

      -- Atualiza o Netrw para a pasta nova aparecer imediatamente na tela
      vim.cmd("edit .")
    end, { buffer = true, desc = "Create directory (Lua Custom)" })

    vim.bo[0].bufhidden = "wipe"
  end,
})

-- 5. Auto-Close Vim if Netrw is the Last Window Open
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.fn.winnr("$") == 1 and vim.bo.filetype == "netrw" then
      vim.cmd("quit")
    end
  end,
})

vim.keymap.set("n", "<C-n>", toggle_netrw_right, {})
