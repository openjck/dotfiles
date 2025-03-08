-- When choosing a colorscheme, I especially care about the appearance of the
-- following:
--
--   * Completion hovers (e.g., CTRL-N in normal mode)
--   * Diffs
--   * Document highlights (see document-highlight.lua)
--   * Git commit messages, while being authored
--   * LSP hovers (e.g., vim.lsp.buf.hover)
--   * The patterns highlighted by mini.hipatterns
--   * The telescope search window
vim.cmd.colorscheme('onedark')

-- Highlight the column whose position is 1 greater than the value of
-- "textwidth".
--
-- The "colorcolumn" option accepts a value prepended with + or -, which is then
-- added to or subtracted from the value of "textwidth".
vim.opt.colorcolumn = '+1'

-- Show the ruler, which mini.basics disables.
--
-- I find the ruler useful, especially when I want to know which column I'm in,
-- so that I can avoid going over any line length limit.
vim.opt.ruler = true
