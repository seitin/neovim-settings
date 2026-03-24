local fzf = require "fzf-lua"
fzf.setup { defaults = { git_icons = false } }

local map = function(lhs, cmd)
  vim.keymap.set("n", lhs, cmd, { silent = true })
end

map("<C-\\>", function() fzf.buffers() end)
map("<C-p>", function() fzf.files() end)
map("<C-g>", function() fzf.grep_project() end)
map("<C-x><C-h>", function() fzf.help_tags() end)
