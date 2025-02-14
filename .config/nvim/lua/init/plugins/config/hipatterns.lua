local hipatterns = require('mini.hipatterns')

-- This configuration is based on an example configuration published in the
-- mini.hipatterns README.
--
-- https://github.com/echasnovski/mini.hipatterns/tree/fbf1e2195fdd65cf1bc970316c28098257728868?tab=readme-ov-file#example-usage
hipatterns.setup({
  highlighters = {

    -- Highlight various terms when they appear separately from other text. Lua
    -- patterns are used. Lua patterns are intended to be simpler, more
    -- lightweight alternatives to regular expressions.
    --
    -- INPROG is a keyword I often add in comments to remind myself of things
    -- that should be addressed before I open a pull request or merge request.
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    inprog = { pattern = '%f[%w]()INPROG()%f[%W]', group = 'MiniHipatternsHack' },

    -- Highlight hex color strings (`#rrggbb`) using that color.
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
