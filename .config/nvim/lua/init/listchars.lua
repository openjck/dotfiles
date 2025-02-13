-- Show custom listchars. Neovim sets some defaults, but I prefer to use
-- characters that are unlikely to appear in source code.
--
-- These characters are a mix of the characters suggested in the following
-- Reddit thread:
--
-- https://www.reddit.com/r/vim/comments/4hoa6e/what_do_you_use_for_your_listchars/
vim.opt.list = true
vim.opt.listchars:append({ tab = '▸-' })
vim.opt.listchars:append({ trail = '█' })
vim.opt.listchars:append({ extends = '⟩' })
vim.opt.listchars:append({ precedes = '⟨' })
vim.opt.listchars:append({ nbsp = '␣' })
