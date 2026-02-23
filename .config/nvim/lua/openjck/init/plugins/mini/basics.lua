local basics = require('mini.basics')

basics.setup({
  mappings = {
    -- Use <C-hjkl> to navigate between panes (just like the keybindings
    -- vim-tmux-navigator offers, making vim-tmux-navigator unnecessary), and
    -- use <C-arrow> to adjust pane size.
    windows = true,
  }
})
