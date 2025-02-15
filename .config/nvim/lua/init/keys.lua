-- Disable the F1 key. I almost never hit it intentionally. When it's hit, it's
-- almost always because I meant to hit the escape key.
vim.keymap.set({ 'n', 'i' }, '<F1>', '<Nop>', { noremap = true })

-- Disable ex mode.
--
-- https://stackoverflow.com/a/12753980/4297741
vim.keymap.set('n', 'Q', '<Nop>', { noremap = true })
vim.keymap.set('n', 'gQ', '<Nop>', { noremap = true })
