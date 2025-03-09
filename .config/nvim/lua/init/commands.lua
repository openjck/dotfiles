-- Add a "Reconfigure" command to reconfigure an active Neovim session based on
-- the latest configuration. (This is sort of like "rebash" for Neovim.)
--
-- The "bar = true" option adds support for combining this command with other
-- commands. This is used in leader.vim.
vim.api.nvim_create_user_command(
  'Reconfigure',
  function()
    vim.cmd('source ' .. vim.fn.stdpath('config') .. '/init.lua')
  end,
  {
    bang = true,
    bar = true,
  }
)
