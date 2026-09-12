return {
  -- Points Neovim to the high-performance Go-native wrapper
  cmd = { "tsgo", "--lsp", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", ".git"),
  single_file_support = true,
  settings = {
    typescript = {
      -- You can add specialized TS compiler checks or diagnostics configs here
    },
  },
}
