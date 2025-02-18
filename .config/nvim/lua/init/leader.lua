local telescopeBuiltin = require('telescope.builtin')
local telescopeCustom = require('entities.telescope')

function leader_map(description, keys, action, noremap)
  noremap = noremap or false

  vim.keymap.set(
    'n',
    string.format('<Leader>%s', keys),
    action,
    {
      desc = description,
      noremap = noremap,
    }
  )
end

-- Use the spacebar as the leader key.
--
-- Mapping `<Space>` to `<Nop>` before mapping `<Space>` to `<Leader>` ensures
-- that the spacebar does not fall back to its default behavior when
-- `timeoutlen` expires, assuming `timeout` is enabled.
--
-- https://stackoverflow.com/a/74906531

vim.keymap.set(
  'n',
  '<Space>',
  '<Nop>',
  {
    silent = true,
    noremap = true,
  }
)

vim.g.mapleader = ' '

----------
-- Find --
----------

leader_map('Find project files', 'fp', telescopeBuiltin.find_files)
leader_map('Find help', 'fh', telescopeBuiltin.help_tags)
leader_map('Find dotfiles', 'fd', telescopeCustom.dotfiles)

------------------------
-- Edit (as in :edit) --
------------------------

leader_map('Edit next', 'en', '<Cmd>next<CR>', true)
leader_map('Edit previous', 'ep', '<Cmd>previous<CR>', true)

----------
-- Hide --
----------

leader_map('Hide highlights', 'hh', '<Cmd>nohlsearch<CR>', true)
