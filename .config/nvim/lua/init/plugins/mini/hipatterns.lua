local hipatterns = require('mini.hipatterns')

function unbusted(busted_string)
  return busted_string:gsub('<busted>', '')
end

-- This configuration is based on an example configuration published in the
-- mini.hipatterns README.
--
-- https://github.com/echasnovski/mini.hipatterns/tree/fbf1e2195fdd65cf1bc970316c28098257728868?tab=readme-ov-file#example-usage
hipatterns.setup({
  highlighters = {

    -- Highlight terms that appear separately from other text.
    --
    -- Lua patterns are used. Lua patterns are intended to be like simpler
    -- regular expressions that are easier to parse. I personally find the
    -- syntax confusing, but that's probably only because I have experience with
    -- regular expressions. If I had never used regular expressions, I'm sure
    -- Lua patterns would seem straightforward. In any case, I don't really
    -- understand the syntax, but it's taken from examples in the hipatterns
    -- documentation.
    --
    -- Below, each value of a "pattern" property contains the string "<busted>",
    -- which is removed by the "unbusted" function. That's only done so that
    -- searches for those terms don't match this file itself. Underscores are
    -- used in property names for the same reason.
    --
    -- IN<busted>PROG (yes, mentally remove the string "<busted>" while reading
    -- this) is a keyword I often use to mark work in progress that should be
    -- modified before a pull request / merge request is opened.
    fix_me = {
      pattern = unbusted('%f[%w]()FIX<busted>ME()%f[%W]'),
      group = 'MiniHipatternsFixme',
    },

    to_do = {
      pattern = unbusted('%f[%w]()TO<busted>DO()%f[%W]'),
      group = 'MiniHipatternsTodo',
    },

    in_prog = {
      pattern = unbusted('%f[%w]()IN<busted>PROG()%f[%W]'),
      group = 'MiniHipatternsHack',
    },

    -- Highlight hex color strings (`#rrggbb`) using that color.
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
