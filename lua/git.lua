vim.pack.add({
  {
    src = "https://github.com/NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      -- "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
  },
})
vim.pack.add({
  {
    src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "https://github.com/nvim-treesitter/nvim-treesitter", "https://github.com/echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    opts = {

      latex = {
        enabled = false,
      },
    },
  },
})
vim.pack.add({ { src = "https://github.com/lewis6991/gitsigns.nvim" } })
require("gitsigns").setup({
  current_line_blame = true,

  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
    delay = 50, -- Delay before blame virtual text displays (in ms)
    ignore_whitespace = false,
    virt_text_priority = 100,
  },

  current_line_blame_formatter = "<author> | <author_time:%Y-%m-%d %H:%M> - <summary>",
})
