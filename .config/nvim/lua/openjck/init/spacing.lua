-- The following resources explain these settings well:
--
-- http://vimcasts.org/episodes/tabs-and-spaces/
-- https://medium.com/@arisweedler/tab-settings-in-vim-1ea0863c5990
--
-- Note: By default, Neovim enables autoindent, enables smarttab, and customizes
-- the backspace. If changing a value here does not seem to have the desired
-- effect, that may be why. For example, it may appear that the value of
-- softtabstop is being ignored because smarttab and autoindent are enabled.
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
