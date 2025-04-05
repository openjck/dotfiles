-- Disable the F1 key. I almost never hit it intentionally. When it's hit, it's
-- almost always because I meant to hit the escape key.
vim.keymap.set({ 'n', 'i' }, '<F1>', '<Nop>', { noremap = true })

-- Disable Ex mode and the search string command-line window.
--
-- https://stackoverflow.com/a/79440961/715866
vim.keymap.set('n', 'gQ', '<Nop>', { noremap = true })
vim.keymap.set('n', 'q:', '<Nop>', { noremap = true })
vim.keymap.set('n', 'q/', '<Nop>', { noremap = true })
vim.keymap.set('n', 'q?', '<Nop>', { noremap = true })
