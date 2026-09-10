vim.pack.add({ { src = 'https://github.com/nvim-lua/plenary.nvim' } })
vim.pack.add({ { src =
    "https://github.com/aserowy/tmux.nvim",
    config = function()
      return require("tmux").setup({
        copy_sync = {
          enable = true
        },
      })
    end
  }
})

vim.pack.add({ { src =
    "https://github.com/nvim-lualine/lualine.nvim",
    dependencies = { "https://github.com/nvim-tree/nvim-web-devicons" }
  }
})

vim.pack.add({ { src =
    "https://github.com/bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000
  }
})
vim.pack.add({ { src =
    "https://github.com/folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }
})
vim.pack.add({ { src = "https://github.com/ibhagwan/fzf-lua" } })
vim.pack.add({ { src = "https://github.com/nvim-tree/nvim-tree.lua" } })
vim.pack.add({ { src = "https://github.com/nvim-tree/nvim-web-devicons" } })
vim.pack.add({ { src = "https://github.com/jremmen/vim-ripgrep" } })
vim.pack.add({ { src =
    "https://github.com/nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("treesitter-settings")
    end,
  }
})
vim.pack.add({ { src = "https://github.com/tpope/vim-commentary" } })
vim.pack.add({ { src = "https://github.com/yamatsum/nvim-cursorline" } })
  -- { "lithammer/nvim-diagnosticls" },
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

vim.pack.add({ { src =
    "https://github.com/stevearc/dressing.nvim",
    event = "VeryLazy"
  }
})
vim.pack.add({ { src =
    "https://github.com/rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify-settings")
    end,
  }
})
vim.pack.add({ { src =
    "https://github.com/folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key-settings")
    end,
  }
})
vim.pack.add({ { src =
    "https://github.com/folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufRead",
    config = function()
      require("trouble-settings")
    end,
  }
})
vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig" } })



require("default-settings")

