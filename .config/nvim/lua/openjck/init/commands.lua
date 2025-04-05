local orientation_enum = require('openjck.enums.orientation')

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
    -- Before using this approach, I was running into a problem where running
    -- this command did not cause any changes in Lua modules (e.g.,
    -- openjck.init.enums.orientation) to take effect.
    --
    -- ChatGPT told me that Lua modules imported with require() are cached, so
    -- if "init.lua" is simply sourced, without first invalidating those caches,
    -- as I was doing before, none of the changes in Lua modules will take
    -- effect.
    --
    -- ChatGPT recommended a solution like this to invalidate the caches. As it
    -- turns out, it's almost identical to something recommended on Reddit:
    --
    -- https://www.reddit.com/r/neovim/comments/puuskh/comment/he5vnqc/
    --
    -- From testing, this does do what I want. With this approach, changes to
    -- Lua modules do take effect when this command is run.
    --
    -- To easily find caches that need to be invalidated, all modules are in
    -- a scope named "openjck".
    for name,_ in pairs(package.loaded) do
      if name:match('^openjck') then
        package.loaded[name] = nil
      end
    end

    dofile(vim.env.MYVIMRC)
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
