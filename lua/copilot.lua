require("CopilotChat").setup {
  -- See Configuration section for options
  model = "claude-sonnet-4.5",
  highlight_headers = false,
  separator = '---',
  error_header = '> [!ERROR] Error',
}

-- Register copilot-chat filetype
require('render-markdown').setup({
  file_types = { 'markdown', 'copilot-chat' },
})

local function setup_keymaps()
  local keymaps = {
    { "<leader>ce", "<cmd>CopilotChatExplain<cr>",  desc = "CopilotChat - Explain code" },
    { "<leader>ct", "<cmd>CopilotChatTests<cr>",    desc = "CopilotChat - Generate tests" },
    { "<leader>cr", "<cmd>CopilotChatReview<cr>",   desc = "CopilotChat - Review code" },
    { "<leader>cm", "<cmd>CopilotChatCommit<cr>", desc = "CopilotChat - Commit code" },
    { "<leader>cb", "<cmd>CopilotChat 'Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block. Write it in PT-BR.'<cr>", desc = "CopilotChat - Commit code" },


  }

  for _, keymap in ipairs(keymaps) do
    vim.keymap.set({ "n", "v" }, keymap[1], keymap[2], { desc = keymap.desc })
  end
end

setup_keymaps()
