local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- TODO-комментарий
  s("todo", {
    t("-- TODO: "),
    i(1, "описание задачи")
  }),

  -- Функция Lua
  s("func", fmt([[
  function {}({})
    {}
  end
  ]], {
    i(1, "function_name"),
    i(2, "args"),
    i(3, "-- тело функции")
  })),

  -- Логирование
  s("log", fmt([[print("{}: ", {})]], {
    i(1, "сообщение"),
    i(2, "значение")
  })),

  -- Таблица Lua
  s("tbl", fmt([[
  local {} = {{
    {}
  }}
  ]], {
    i(1, "table_name"),
    i(2, "-- элементы таблицы")
  })),

  -- If-else конструкция
  s("ifel", fmt([[
  if {} then
    {}
  else
    {}
  end
  ]], {
    i(1, "condition"),
    i(2, "-- if branch"),
    i(3, "-- else branch")
  })),

  -- Быстрый цикл for
  s("fori", fmt([[
  for {} = {}, {} do
    {}
  end
  ]], {
    i(1, "i"),
    i(2, "1"),
    i(3, "n"),
    i(4, "-- тело цикла")
  })),

  -- Импорт модуля
  s("req", fmt([[local {} = require("{}")]], {
    i(1, "module"),
    i(2, "module.path")
  }))
}
