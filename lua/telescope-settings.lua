local actions = require "telescope.actions"

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"node_modules", ".git"},
    path_display = {"truncate"},
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-h>"] = actions.which_key,
        ['<C-d>'] = actions.delete_buffer,
      },
      n = {
        ["<C-h>"] = actions.which_key,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
vim.api.nvim_set_keymap("n", "<Space>p", "<cmd>Telescope find_files<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Space>g", "<cmd>Telescope live_grep<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Space>b", "<cmd>Telescope buffers<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", {noremap = true})
