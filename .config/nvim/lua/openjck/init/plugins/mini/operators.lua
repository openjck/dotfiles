-- This plugin offers a variety of features, but the one I'm most interested in
-- is the feature for more easily replacing text with the contents of a
-- register. I previously used the "vim-scripts/ReplaceWithRegister" plugin for
-- that.
local operators = require('mini.operators')

operators.setup({
  exchange = {
    -- Use "gX" rather than "gX" for exchanging selections. gx normally opens
    -- the URL under the cursor, and I do that often.
    prefix = 'gX',
  },
})
