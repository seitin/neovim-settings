-- ==========================================================================
-- 1. DECLARAÇÃO DE PLUGINS NATIVOS (Neovim 0.12+)
-- ==========================================================================

-- Adiciona e baixa automaticamente as dependências do Neo-tree
vim.pack.add({ { src = "https://github.com/nvim-lua/plenary.nvim" } })
vim.pack.add({ { src = "https://github.com/MunifTanjim/nui.nvim" } })
vim.pack.add({ { src = "https://github.com/nvim-tree/nvim-web-devicons" } }) -- Ícones visuais opcionais

-- Adiciona o plugin principal do Neo-tree
vim.pack.add({ { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" } })

-- ==========================================================================
-- 2. CONFIGURAÇÃO DO NEO-TREE (Substitui as regras antigas do Netrw)
-- ==========================================================================

require("neo-tree").setup({
  close_if_last_window = true, -- Fecha o nvim se o neo-tree for a última janela aberta
  popup_border_style = "rounded",

  -- Sincroniza e mostra o status do GIT na árvore!
  git_status = {
    enabled = true,
    visible = true,
  },

  window = {
    position = "right", -- Coloca o Neo-tree na DIREITA igual você pediu!
    width = 30,
    mappings = {
      ["h"] = "close_node", -- Mantém sua navegação intuitiva de fechar pastas
      ["l"] = "open", -- Abre arquivos/pastas
      ["a"] = "add", -- Adiciona arquivos/pastas estilo nvim-tree
      ["d"] = "delete", -- Deleta arquivos
      ["r"] = "rename", -- Renomeia arquivos
    },
  },
})

-- Atalho universal para abrir/fechar o Neo-tree na direita
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent = true, desc = "Toggle Neo-tree" })
