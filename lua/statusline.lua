vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim", "https://github.com/nvim-tree/nvim-web-devicons" },
})

local function lsp_server()
  local msg = "No Active LSP"
  local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end

require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = {
      "mode",
    },
    lualine_b = { "branch", "diff" },
    lualine_c = {},
    lualine_x = { lsp_server },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  winbar = {},
  tabline = {
    lualine_a = { { "filename", path = 1 }, "diagnostics" },
    lualine_b = {},
  },
  extensions = { "nvim-tree" },
})
