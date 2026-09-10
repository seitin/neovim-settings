-- ~/.config/nvim/lsp/lua_ls.lua
-- The filename must match the language server name

return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  -- Tell Neovim when to activate the server based on root directories
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        -- Fixes the unrecognized 'vim' global warning
        globals = { "vim" },
      },
      workspace = {
        -- Gives you native Neovim API auto-completions
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
