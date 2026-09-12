vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig" } })
vim.pack.add({ { src = "https://github.com/mason-org/mason-lspconfig.nvim" } })
vim.pack.add({ { src = "https://github.com/mason-org/mason.nvim" } })
vim.pack.add({ 'https://github.com/saghen/blink.lib', 'https://github.com/saghen/blink.cmp' })
local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup()

vim.diagnostic.config({ virtual_text = true })

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show function signature description" })

vim.o.pumheight = 15 -- Limits menu height so it doesn't run out of screen space
-- vim.o.complete = ".,w,b,o"
-- vim.o.completeopt = "menuone,noselect,noinsert,fuzzy,nosort"

vim.cmd([[ syntax enable ]])
vim.cmd([[ set conceallevel=2 ]])
vim.cmd([[ set wildmenu wildmode=longest:full ]])
vim.cmd([[ set nocompatible              " be iMproved, required ]])
vim.cmd([[ set ignorecase ]])
vim.cmd([[ set smartcase ]])
vim.cmd([[ set clipboard=unnamed ]])

vim.cmd([[ filetype off                  " required ]])
vim.cmd([[ filetype plugin indent on    " required ]])

vim.cmd([[ :set softtabstop=2 ]])
vim.cmd([[ :set shiftwidth=2 ]])
vim.cmd([[ :set expandtab ]])
vim.cmd([[ :set relativenumber ]])
vim.cmd(
  [[ :set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/**/*.*,*/venv/**,**/.git/**,**/lib/**,**/bin/**,**/etc/**,**/lib64/**,_next/** ]]
)

vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.shortmess:append("c")

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")

-- Use Tab to navigate down the suggestion list
vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  else
    return "<Tab>"
  end
end, { expr = true, noremap = true })

-- Use Shift+Tab to navigate up the suggestion list
vim.keymap.set("i", "<S-Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"
  else
    return "<S-Tab>"
  end
end, { expr = true, noremap = true })
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    -- Enable completion triggered by <C-x><C-o>
    vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
  end,
})

local hover_timer = nil

vim.api.nvim_create_autocmd("CompleteChanged", {
  callback = function()
    -- Clear any pending timer to avoid flickering when scrolling fast
    if hover_timer then
      vim.fn.timer_stop(hover_timer)
      hover_timer = nil
    end

    local info = vim.fn.complete_info({ "selected" })

    -- Check if the menu is open and an item is highlighted (index is not -1)
    if vim.fn.pumvisible() == 1 and info.selected ~= -1 then
      -- Use a tiny 50ms delay so Neovim settles on the new item (Tab or Arrow)
      hover_timer = vim.fn.timer_start(50, function()
        vim.schedule(function()
          -- Verify the menu is still open before rendering
          if vim.fn.pumvisible() == 1 then
            pcall(vim.lsp.buf.hover, {
              focusable = false,
              zindex = 150,
              close_events = { "CursorMoved", "InsertLeave", "CompleteDone" },
            })
          end
        end)
      end)
    end
  end,
})

