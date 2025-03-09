-- Hard wrap at 80 characters.
--
-- Some people use a value of 79 so that newlines can be visualized via
-- listchars. Others use 78 because their terminal has one character of
-- horizontal padding on either side. I don't care about visualizing newlines,
-- and my terminal doesn't have horizontal padding, so 80 it is.
vim.opt.textwidth = 80

-- Disable ignorecase and smartcase, which are enabled by mini.basics.
--
-- I prefer searching exact matches and appending "\c" to a search when I want
-- to ignore case.
vim.opt.ignorecase = false
vim.opt.smartcase = false

-- Don't add newlines to existing files that do not have them.
vim.opt.fixendofline = false

-- When using CTRL-A and CTRL-X, treat all numbers as unsigned.
--
-- With this option enabled, any number with a dash before it is considered to
-- be a positive number. For example, in "2024-06-05", the "06" is considered to
-- be the number 6, not the number -6. Therefore, CTRL-A changes it to "07",
-- whereas CTRL-A would change it to "05" if this option were not enabled.
--
-- One drawback, which seems unavoidable without some kind of plugin, is that
-- this option makes it impossible to use CTRL-A and CTRL-X when the resulting
-- number would actually be negative. For example, with this option enabled,
-- using CTRL-X on the number "0" has no effect. I'll happily take that
-- trade-off because I find working with a positive number that's preceded by
-- a dash is more common than working with a number that's actually negative.
vim.opt.nrformats:append('unsigned')

-- For all file types:
--
--   c: Automatically wrap comments while writing them, inserting the comment
--      character at the beginning of each line.
--   r: Automatically insert the comment character at the beginning of a newly
--      created line when hitting <Enter> in insert mode.
--   o: Automatically insert the comment character at the beginning of a newly
--      created line when hitting "o" or "O" in normal mode.
--
-- If a comment character is automatically inserted but not wanted, type CTRL-U
-- to remove it. I was using Vim/Neovim for about 15 years before I discovered
-- this.
--
-- If enabling these format options for all filetypes has unintended
-- consequences, I should at least enable them for the following filetypes,
-- which for some reason, unlike most filetypes, do not get them by default:
--
--   - tmux
--
-- I can achieve that by putting these same lines in a file named
-- after/ftplugin/<filetype>.lua file.
vim.opt.formatoptions:append('cro')
