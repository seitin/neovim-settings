require("CopilotChat").setup {
  -- See Configuration section for options
  model = "claude-sonnet-4",
  highlight_headers = false,
  separator = '---',
  error_header = '> [!ERROR] Error',
}

vim.keymap.set({ 'n', 'v' }, '<leader>ccs', function()
  local input = vim.fn.input("Perplexity: ")
  if input ~= "" then
    require("CopilotChat").ask(input, {
      agent = "perplexityai",
      selection = false,
    })
  end
end, { desc = "CopilotChat - Perplexity Search" })

-- Register copilot-chat filetype
require('render-markdown').setup({
  file_types = { 'markdown', 'copilot-chat' },
})

local function setup_keymaps()
  local keymaps = {
    { "<leader>cce", "<cmd>CopilotChatExplain<cr>",  desc = "CopilotChat - Explain code" },
    { "<leader>cct", "<cmd>CopilotChatTests<cr>",    desc = "CopilotChat - Generate tests" },
    { "<leader>ccr", "<cmd>CopilotChatReview<cr>",   desc = "CopilotChat - Review code" },
    { "<leader>ccR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
  }

  for _, keymap in ipairs(keymaps) do
    vim.keymap.set("n", keymap[1], keymap[2], { desc = keymap.desc })
  end
end

setup_keymaps()
