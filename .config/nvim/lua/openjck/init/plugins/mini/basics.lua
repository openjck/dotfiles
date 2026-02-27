local basics = require('mini.basics')

basics.setup({
  mappings = {
    -- Use <C-hjkl> to navigate between panes, and use <C-arrow> to adjust pane
    -- size.
    --
    -- The first part is _part_ of what vim-tmux-navigator does, but
    -- vim-tmux-navigator is still needed because it allows moving _between_
    -- Neovim and tmux with those keystrokes.
    windows = true,
  }
})
