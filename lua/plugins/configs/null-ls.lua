local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local exist, custom = pcall(require, "custom")
local sources = exist
    and type(custom) == "table"
    and custom.setup_sources
    and custom.setup_sources(null_ls.builtins)
    or {}

null_ls.setup({
  debug = false,
  sources = sources
})
