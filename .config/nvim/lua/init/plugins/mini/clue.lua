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
    -- Show the clue window when the square bracket keys are pressed.
    -- mini.bracketed provides functionality (and clues!) for brackets.
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },

    -- Show the clue window when the backslash is pressed. mini.basics provides
    -- functionality (and clues!) for the backslash.
    { mode = 'n', keys = '\\' },

    -- Show the clue window when the "<Leader>" key is pressed.
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Show the clue window when the "g" key is pressed.
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Show the clue window when the "z" key is pressed.
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },

    -- Show the clue window when the "<C-w>" keystroke is pressed.
    { mode = 'n', keys = '<C-w>' },

    -- Show the clue window for built-in completion.
    { mode = 'i', keys = '<C-x>' },

    -- Show the clue window for marks.
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Show the clue window for registers.
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },
  },

  clues = {
    clue.gen_clues.g(),
    clue.gen_clues.z(),
    clue.gen_clues.windows(),
    clue.gen_clues.builtin_completion(),
    clue.gen_clues.marks(),
    clue.gen_clues.registers(),

    -- Add clues for <Leader> mappings.
    { mode = 'n', keys = '<Leader>e', desc = 'Edit' },
    { mode = 'n', keys = '<Leader>f', desc = 'Find' },
    { mode = 'n', keys = '<Leader>g', desc = 'Go' },
      { mode = 'n', keys = '<Leader>gi', desc = 'Issue' },
    { mode = 'n', keys = '<Leader>h', desc = 'Hide' },
    { mode = 'n', keys = '<Leader>m', desc = 'Modify' },
    { mode = 'n', keys = '<Leader>s', desc = 'Show' },
    { mode = 'n', keys = '<Leader>t', desc = 'Tab' },
      { mode = 'n', keys = '<Leader>tm', desc = 'Move' },

    -- Enable submode support for "Tab move" <Leader> mappings.
    { mode = 'n', keys = '<Leader>tm$', postkeys = '<Leader>tm' },
    { mode = 'n', keys = '<Leader>tm0', postkeys = '<Leader>tm' },
    { mode = 'n', keys = '<Leader>tmh', postkeys = '<Leader>tm' },
    { mode = 'n', keys = '<Leader>tml', postkeys = '<Leader>tm' },
  },
})
