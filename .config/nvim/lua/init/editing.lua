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
