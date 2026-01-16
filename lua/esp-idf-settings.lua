-- ESP-IDF specific settings and helpers
local M = {}

-- Function to check if we're in an ESP-IDF project
M.is_esp_idf_project = function()
  local root_markers = { 'sdkconfig', 'sdkconfig.defaults', 'CMakeLists.txt' }
  local cwd = vim.fn.getcwd()
  
  for _, marker in ipairs(root_markers) do
    if vim.fn.filereadable(cwd .. '/' .. marker) == 1 then
      return true
    end
  end
  return false
end

-- Set up ESP-IDF specific settings when in an ESP-IDF project
M.setup = function()
  if M.is_esp_idf_project() then
    -- Set up autocommands for ESP-IDF projects
    vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
      pattern = {"*.c", "*.h", "*.cpp", "*.hpp"},
      callback = function()
        -- Ensure compile_commands.json exists
        local compile_commands = vim.fn.getcwd() .. '/build/compile_commands.json'
        if vim.fn.filereadable(compile_commands) == 0 then
          vim.notify(
            "compile_commands.json not found. Run 'idf.py build' to generate it.",
            vim.log.levels.WARN
          )
        end
      end,
    })
    
    -- Optional: Add ESP-IDF specific keymaps
    vim.keymap.set('n', '<leader>eb', ':!idf.py build<CR>', { desc = 'ESP-IDF Build' })
    vim.keymap.set('n', '<leader>ef', ':!idf.py flash<CR>', { desc = 'ESP-IDF Flash' })
    vim.keymap.set('n', '<leader>em', ':!idf.py menuconfig<CR>', { desc = 'ESP-IDF Menuconfig' })
    vim.keymap.set('n', '<leader>ec', ':!idf.py fullclean<CR>', { desc = 'ESP-IDF Clean' })
    
    vim.notify("ESP-IDF project detected", vim.log.levels.INFO)
  end
end

-- Call setup automatically
M.setup()

return M
