-- Automatically equalize splits when the terminal window is resized. For
-- example, if there is a 50/50 vertical split when the terminal window is
-- small, it will still be a 50/50 vertical split if the terminal window is
-- maximized.
--
-- https://vi.stackexchange.com/a/206/28836
--
-- If the split is not 50/50, it will become 50/50 when the terminal window is
-- resized. There are a couple of plugins[1][2] which claim to handle cases like
-- that more intelligently, but I find they don't always work correctly.
--
-- [1] https://github.com/vim-scripts/ProportionalResize
-- [2] https://github.com/drzel/vim-in-proportion
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    vim.cmd('wincmd =')
  end
})
