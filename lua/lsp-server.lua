vim.lsp.start({
  name = 'my-server-name',
  cmd = {
    {'typescript-language-server'},
    {'pyright-langserver'},
    {'lua-language-server'},
    {'vscode-html-language-server'},
    {'vscode-css-language-server'},
    {'vscode-json-language-server'},
    {'vscode-eslint-language-server'},
    {'bash-language-server'},
    {'vim-language-server'},
    {'sql-language-server'},
    {'docker-langserver'},
    {'gopls'},
  }
})


require("lsp-format").setup {}
require("lspconfig").gopls.setup { on_attach = require("lsp-format").on_attach }
