local ok, notify = pcall(require, "notify")
if not ok then return end

notify.setup({
  stages = "fade",
  timeout = 3000,
  max_width = 80,
  top_down = false,
})

vim.notify = notify
