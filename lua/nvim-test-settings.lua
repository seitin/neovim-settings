
require('nvim-test').setup()

require('nvim-test.runners.jest'):setup {
  command = "./node_modules/.bin/jest",                                       -- a command to run the test runner
  args = { "--collectCoverage=false" },                                       -- default arguments
  env = { CUSTOM_VAR = 'value' },                                             -- custom environment variables

  file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$",   -- determine whether a file is a testfile
  find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" },                  -- find testfile for a file

  filename_modifier = nil,                                                    -- modify filename before tests run (:h filename-modifiers)
  working_directory = nil,                                                    -- set working directory (cwd by default)
}

vim.api.nvim_set_keymap("n", "<Space>t", "<cmd>TestFile<CR>", { noremap = true })
