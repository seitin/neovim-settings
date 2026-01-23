require('minuet').setup {
  virtualtext = {
    auto_trigger_ft = {},
    keymap = {
      -- accept whole completion
      accept = '<A-A>',
      -- accept one line
      accept_line = '<A-a>',
      -- accept n lines (prompts for number)
      -- e.g. "A-z 2 CR" will accept 2 lines
      accept_n_lines = '<A-z>',
      -- Cycle to prev completion item, or manually invoke completion
      prev = '<A-[>',
      -- Cycle to next completion item, or manually invoke completion
      next = '<A-]>',
      dismiss = '<A-e>',
    },
  },
  lsp = {
    enabled_ft = { '*' },
    -- Filetypes excluded from LSP activation. Useful when `enabled_ft` = { '*' }
    disabled_ft = {},
    -- Enables automatic completion triggering using `vim.lsp.completion.enable`
    enabled_auto_trigger_ft = { '*' },
    -- Filetypes excluded from autotriggering. Useful when `enabled_auto_trigger_ft` = { '*' }
    disabled_auto_trigger_ft = {},
    -- if true, warn the user that they should use the native source
    -- instead when the user is using blink or nvim-cmp.
    warn_on_blink_or_cmp = true,
    -- See README section [Built-in Completion, Mini.Completion, and LSP
    -- Setup] for more details on this option.
    adjust_indentation = true,
  },
  provider = 'openai_fim_compatible',
  n_completions = 1, -- recommend for local model for resource saving
  -- I recommend beginning with a small context window size and incrementally
  -- expanding it, depending on your local computing power. A context window
  -- of 512, serves as an good starting point to estimate your computing
  -- power. Once you have a reliable estimate of your local computing power,
  -- you should adjust the context window to a larger value.
  context_window = 512,
  provider_options = {
    openai_fim_compatible = {
      -- For Windows users, TERM may not be present in environment variables.
      -- Consider using APPDATA instead.
      api_key = 'TERM',
      name = 'Ollama',
      end_point = 'http://localhost:11434/v1/completions',
      model = 'qwen2.5-coder:7b',
      optional = {
        max_tokens = 56,
        top_p = 0.9,
      },
    },
  },
}

