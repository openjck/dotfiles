local telescopeBuiltin = require('telescope.builtin')
local telescopeCustom = require('entities.telescope')

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

vim.keymap.set(
  'n',
  '<Leader>ff',
  telescopeBuiltin.find_files,
  {
    desc = 'Find files',
  }
)

vim.keymap.set(
  'n',
  '<Leader>fh',
  telescopeBuiltin.help_tags,
  {
    desc = 'Find help',
  }
)

vim.keymap.set(
  'n',
  '<Leader>fd',
  telescopeCustom.dotfiles,
  {
    desc = 'Find dotfiles',
  }
)
