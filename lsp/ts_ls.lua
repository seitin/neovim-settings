return {
  settings = {
    typescript = {
      tsserver = {
        -- Prevents fetching thousands of auto-imports on a single dot
        maxTsServerMemory = 8092, -- Increases memory pool if you are in a monorepo
      },
    },
    javascript = {
      tsserver = {
        maxTsServerMemory = 8092,
      },
    },
  },
  init_options = {
    preferences = {
      -- This is the crucial setting that stops the dot lag:
      includeCompletionsForModuleExports = false,
    },
  },
}
