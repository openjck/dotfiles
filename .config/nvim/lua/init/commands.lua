local function open_scratch_helper(vertical)
  local split_command

  if vertical then
    split_command = 'vnew'
  else
    split_command = 'new'
  end

  local current_filetype = vim.bo.filetype
  vim.cmd(split_command)
  vim.cmd('set filetype=' .. current_filetype)
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
    open_scratch_helper()
  end,
  {
    bang = true,
  }
)

vim.api.nvim_create_user_command(
  'OpenVScratch',
  function()
    open_scratch_helper(true)
  end,
  {
    bang = true,
  }
)
