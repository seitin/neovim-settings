local ok, trouble = pcall(require, "trouble")
if not ok then return end

trouble.setup({
  icons = true,
  fold_open = "",
  fold_closed = "",
  use_diagnostic_signs = true,
})
