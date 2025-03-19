-- Lua doesn't have true enums, but tables are compared by reference rather than
-- value, so an empty table can be used like a unique identifier, and a table of
-- tables can be used like an enum.
--
-- https://stackoverflow.com/a/77170992
return function(elements)
  local enum = {}
  for _, element in ipairs(elements) do
    enum[element] = {}
  end
  return enum
end
