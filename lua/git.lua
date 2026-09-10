vim.pack.add({ { src = "https://github.com/f-person/git-blame.nvim" } })
vim.pack.add({ { src =
    "https://github.com/NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      -- "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true
  }
})
vim.pack.add({ { src =
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'https://github.com/nvim-treesitter/nvim-treesitter', 'https://github.com/echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    opts = {

      latex = {
        enabled = false,
      }
    },
  }
})
