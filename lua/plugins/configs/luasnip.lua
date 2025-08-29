local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({
  paths = { "~/.config/nvim/lua/snippets/" }
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
