local treesitter = require("nvim-treesitter")

local desired_parsers = {
  "c",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "typescript",
  "javascript",
  "css",
  "html",
  "http",
  "bash",
  "astro",
  "qmljs",
}

treesitter.setup()

local installed_parsers = treesitter.get_installed("parsers")
local missing_parsers = vim.tbl_filter(function(parser)
  return not vim.list_contains(installed_parsers, parser)
end, desired_parsers)

if #missing_parsers > 0 then
  treesitter.install(missing_parsers)
end

local max_filesize = 100 * 1024
local fs_stat = (vim.uv or vim.loop).fs_stat

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter-settings", { clear = true }),
  callback = function(args)
    local buf_name = vim.api.nvim_buf_get_name(args.buf)
    local stats = buf_name ~= "" and fs_stat(buf_name) or nil
    if stats and stats.size > max_filesize then
      return
    end

    local filetype = vim.bo[args.buf].filetype
    local language = vim.treesitter.language.get_lang(filetype) or filetype
    if not vim.list_contains(treesitter.get_available(), language) then
      return
    end

    if not vim.list_contains(treesitter.get_installed("parsers"), language) then
      treesitter.install(language)
      return
    end

    vim.treesitter.start(args.buf, language)
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  end,
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false
