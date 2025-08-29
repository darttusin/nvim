local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

return {
  s("func", {
    t("def "), i(1, "func_name"), t("() -> None:"),
    t({ "", "    " }), t("# FIXME: empty func"),
    t({ "", "    " }), t("return")
  }),

  s("ld", {
    t("logger.debug("), t("'msg="), t('"'), i(1, "message"), t('"'), t("')")
  }),

  s("lw", {
    t("logger.warning("), t("'msg="), t('"'), i(1, "message"), t('"'), t("')")
  }),

  s("li", {
    t("logger.info("), t("'msg="), t('"'), i(1, "message"), t('"'), t("')")
  }),

  s("le", {
    t("logger.error("), t("'msg="), t('"'), i(1, "message"), t('"'), t("')")
  }),

  s("imp", {
    t("import "), i(1, "module")
  }),

  s("fimp", {
    t("from "), i(1, "fr"), t(" import "), i(2, "to")
  }),

  s("pr", {
    t("print("), i(1, "\"msg\""), t(")")
  }),

  s("for", {
    t("for "), i(1, "i"), t(" in "), i(2, "range()"), t(":"),
    t({ "", "    " }), i(3, "pass")
  }),

  s("whl", {
    t("while "), i(1, "True"), t(":"),
    t({ "", "    " }), i(2, "pass")
  }),
}
