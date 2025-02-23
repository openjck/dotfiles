local clue = require('mini.clue')

-- This configuration is based on mini.clue's recommended "quick start" configuration.
--
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-clue.md#config-quick-start
clue.setup({
  window = {
    config = {
      -- Ensure the window is wide enough to show all text.
      width = 'auto',
    },
  },

  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },

  clues = {
    clue.gen_clues.builtin_completion(),
    clue.gen_clues.g(),
    clue.gen_clues.marks(),
    clue.gen_clues.registers(),
    clue.gen_clues.windows(),
    clue.gen_clues.z(),

    -- Add clues for <Leader> mappings.
    { mode = 'n', keys = '<Leader>e', desc = 'Edit' },
    { mode = 'n', keys = '<Leader>f', desc = 'Find' },
    { mode = 'n', keys = '<Leader>h', desc = 'Hide' },
    { mode = 'n', keys = '<Leader>t', desc = 'Tabs' },
    { mode = 'n', keys = '<Leader>tm', desc = 'Move' },
  },
})
