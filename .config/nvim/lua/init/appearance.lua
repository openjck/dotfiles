-- When choosing a colorscheme, but the following characteristics are important
-- to me:
--
--   * The "MiniHipatternsFixme", "MiniHipatternsTodo", and "MiniHipatternsHack"
--     highlight groups from mini.hipatterns render nicely.
--   * Diffs are easy to read, with diff sections (additions, removals, changes)
--     being easily identifiable.
--   * LSP hovers (e.g., vim.lsp.hover) stand out clearly.
--   * Completion hovers (e.g., CTRL-N) stand out clearly.
--   * Ideally, when mini.cursorword is being used, the word under the cursor is
--     shown with a differently-colored background rather than with an
--     underline.
vim.cmd.colorscheme('monokai-pro')

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
