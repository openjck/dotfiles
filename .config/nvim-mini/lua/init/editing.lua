-- Disable ignorecase and smartcase, which are enabled by mini.basics.
--
-- I prefer searching exact matches and appending "\c" to a search when I want
-- to ignore case.
vim.o.ignorecase = false
vim.o.smartcase = false
