local ls = require("luasnip")

-- vscode format
require("luasnip.loaders.from_vscode").lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

-- snipmate format
require("luasnip.loaders.from_snipmate").load()
require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

-- lua format
require("luasnip.loaders.from_lua").load()
require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

require("luasnip.loaders.from_lua").load({
  paths = { "./snips.lua" }
})

vim.keymap.set({"i", "s"}, "<C-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({"i", "s"}, "<C-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("n", "<leader>s", "<cmd>LuaSnipListAvailable<cr>", {
  desc = "Показать доступные сниппеты"
})

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        if
            ls.session.current_nodes[vim.api.nvim_get_current_buf()]
            and not ls.session.jump_active
        then
            ls.unlink_current()
        end
    end,
})
