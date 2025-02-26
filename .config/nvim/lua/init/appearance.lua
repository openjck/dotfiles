-- No colorscheme is perfect, but nightfox has some of the best trade-offs among
-- colorschemes I've tried. Some of the most important attributes include:
--
--   * The "MiniHipatternsFixme", "MiniHipatternsTodo", and "MiniHipatternsHack"
--     highlight groups from mini.hipatterns render nicely.
--   * When mini.cursorword is being used, the word under the cursor is shown
--     with a differently-colored background rather than an underline, which
--     I prefer.
--   * LSP hovers (e.g., vim.lsp.hover) stand out clearly.
vim.cmd.colorscheme('nightfox')

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
