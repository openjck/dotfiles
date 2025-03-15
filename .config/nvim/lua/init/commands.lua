local orientation_enum = require('utils.orientation')

local function open_scratch_helper(chosen_orientation)
  local split_command

  if chosen_orientation == orientation_enum.Horizontal then
    split_command = 'new'
  elseif chosen_orientation == orientation_enum.Vertical then
    split_command = 'vnew'
  else
    error('Unsupported orientation')
  end

  local source_buffer_filetype = vim.bo.filetype
  vim.cmd(split_command)
  vim.cmd('set filetype=' .. source_buffer_filetype)
end

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

vim.api.nvim_create_user_command(
  'OpenScratch',
  function()
    open_scratch_helper(orientation_enum.Horizontal)
  end,
  {
    bang = true,
  }
)

vim.api.nvim_create_user_command(
  'OpenVScratch',
  function()
    open_scratch_helper(orientation_enum.Vertical)
  end,
  {
    bang = true,
  }
)
